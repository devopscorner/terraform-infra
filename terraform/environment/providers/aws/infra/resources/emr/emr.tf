# ==========================================================================
#  Resources: EMR / emr.tf (EMR Configuration)
# --------------------------------------------------------------------------
#  Description
# --------------------------------------------------------------------------
#    - VPC References
#    - Route53 Record
#    - Security Group
#    - Bootstrap EMR
# ==========================================================================

# --------------------------------------------------------------------------
#  Resources Tags
# --------------------------------------------------------------------------
locals {
  resources_tags = {
    Name          = "${var.env[local.env]}" == "prod" ? "${var.bucket_name}" : "${var.bucket_name}-${var.env[local.env]}",
    ResourceGroup = "${var.environment[local.env]}-EMR-DEVOPSCORNER"
  }
}

locals {
  vpc_id     = data.aws_vpc.selected.id
  ssh_pubkey = "${var.ssh_public_key}" == "" ? file("~/.ssh/id_rsa.pub") : "${var.ssh_public_key}"
  # subnet_id  = "${var.env[local.env]}" == "lab" ? data.terraform_remote_state.core_state.outputs.ec2_private_1a[0] : data.terraform_remote_state.core_state.outputs.ec2_private_1b[0]
  subnet_id = data.terraform_remote_state.core_state.outputs.ec2_private_1a[0]
  log_uri   = "s3://${var.bucket_name}/log/"
  pem_key   = "${var.ssh_public_key}" == "" ? file("~/.ssh/id_rsa.pub") : "${var.ssh_public_key}"
}

##############
# Amazon EMR #
##############
data "aws_vpc" "selected" {
  id = data.terraform_remote_state.core_state.outputs.vpc_id
}

resource "aws_emr_cluster" "cluster" {
  name          = "emr-cluster-${var.env[local.env]}"
  release_label = var.release_label
  applications  = var.applications

  # service_role = var.service_role
  service_role = aws_iam_role.iam_emr_service_role.arn
  log_uri      = local.log_uri

  configurations_json = <<EOF
[
    {
        "Classification": "spark-env",
        "Configurations": [
            {
                "Classification": "export",
                "Properties": {
                    "PYSPARK_PYTHON": "/usr/bin/python3"
                }
            }
        ],
        "Properties": {}
    },
    {
        "Classification": "emrfs-site",
        "Properties": {
            "fs.s3.consistent": "true"
        }
    }
]
EOF

  termination_protection            = false
  visible_to_all_users              = true
  keep_job_flow_alive_when_no_steps = true
  # security_configuration            = aws_emr_security_configuration.security.name
  # log_encryption_kms_key_id         = "${data.aws_kms_key.cmk_key.arn}"

  #=============================#
  #  Error in Hadoop Debugging  #
  #=============================#
  step = [
    {
      action_on_failure = "CONTINUE"
      name              = "Metastore"

      hadoop_jar_step = [
        {
          jar        = "s3://ap-southeast-1.elasticmapreduce/libs/script-runner/script-runner.jar"
          args       = ["s3://devopscorner-emr/hive/script/script.sh"]
          main_class = ""
          properties = {}
        }
      ]
    }
  ]
  lifecycle {
    ignore_changes = [step]
  }

  #==========================#
  #  step_concurrency_level  #
  #==========================#
  tags = merge(local.tags, local.resources_tags)

  bootstrap_action {
    path = "s3://devopscorner-emr/emr/bootstrap/install-libs.sh"
    name = "InstallPyLibs"
  }

  ec2_attributes {
    key_name                          = var.key_name[local.env]
    subnet_id                         = local.subnet_id
    emr_managed_master_security_group = aws_security_group.sg_master.id
    additional_master_security_groups = aws_security_group.sg_master_add.id
    emr_managed_slave_security_group  = aws_security_group.sg_slave.id
    additional_slave_security_groups  = aws_security_group.sg_slave_add.id
    service_access_security_group     = aws_security_group.sg_service_access.id
    # instance_profile                  = var.instance_profile
    instance_profile = aws_iam_instance_profile.emr_profile.arn
  }

  ebs_root_volume_size = var.ebs_root_volume_size

  #====================================================================================#
  # See https://docs.aws.amazon.com/emr/latest/ManagementGuide/emr-plan-storage.html
  # large	[1x 32GiB], xlarge [2x 32GiB], 2xlarge [4x 32GiB], 4xlarge	[4x 64GiB], 8xlarge	[4x 128GiB]
  #====================================================================================#

  #====================================================================================#
  # See https://docs.aws.amazon.com/emr/latest/ManagementGuide/emr-plan-storage.html
  # large	[1x 32GiB], xlarge [2x 32GiB], 2xlarge [4x 32GiB], 4xlarge	[4x 64GiB], 8xlarge	[4x 128GiB]
  #====================================================================================#

  #====================================================================================#
  # All capacity configurations below uses vcore unit:
  #   - target_on_demand_capacity
  #   - target_spot_capacity
  #   - weighted_capacity
  #====================================================================================#
  master_instance_fleet {
    name                      = "master-fleet-${var.env[local.env]}"
    target_on_demand_capacity = var.master_target_ondemand_capacity
    target_spot_capacity      = var.master_spot_capacity

    launch_specifications {
      on_demand_specification {
        allocation_strategy = var.master_allocation
      }
    }

    instance_type_configs {
      ebs_config {
        size                 = var.master_ebs_volume_size
        type                 = "gp2"
        volumes_per_instance = var.master_ebs_number
      }
      instance_type = var.master_instance_type
      ## Number of Instances
      weighted_capacity = var.master_weight_capacity
    }
  }

  core_instance_fleet {
    name                      = "core-fleet-${var.env[local.env]}"
    target_on_demand_capacity = var.core_target_ondemand_capacity
    target_spot_capacity      = var.core_spot_capacity

    launch_specifications {
      on_demand_specification {
        allocation_strategy = var.core_allocation
      }
    }

    instance_type_configs {
      ebs_config {
        size                 = var.core_ebs_volume_size
        type                 = "gp2"
        volumes_per_instance = var.core_ebs_number
      }
      instance_type = var.core_instance_type
      ## Number of Core
      weighted_capacity = var.core_weight_capacity
    }
  }

}

#====================================================================================#
# See https://docs.aws.amazon.com/emr/latest/ManagementGuide/emr-instance-fleet.html
# See https://docs.aws.amazon.com/emr/latest/ManagementGuide/emr-master-core-task-nodes.html
#====================================================================================#
# Create task fleet
resource "aws_emr_instance_fleet" "task" {
  name                      = "task-fleet-${var.env[local.env]}"
  cluster_id                = aws_emr_cluster.cluster.id
  target_on_demand_capacity = var.task_target_ondemand_capacity /* Should have a value of one or greater for either targetOnDemandCapacity or targetSpotCapacity */
  target_spot_capacity      = var.task_spot_capacity /* Should have a value of one or greater for either targetOnDemandCapacity or targetSpotCapacity */

  launch_specifications {
    spot_specification {
      allocation_strategy      = "capacity-optimized" # only capacity-optimized is supported
      timeout_action           = "TERMINATE_CLUSTER"  # or SWITCH_TO_ON_DEMAND
      timeout_duration_minutes = 30                   # only during cluster provision
    }
  }

  #====================================================================================#
  # See https://aws.amazon.com/ec2/spot/instance-advisor/
  # Select instance with low frequency of interuptions
  #====================================================================================#
  instance_type_configs {
    ebs_config {
      size                 = var.task_ebs_volume_size
      type                 = "gp2"
      volumes_per_instance = var.task_ebs_number
    }
    bid_price_as_percentage_of_on_demand_price = var.task_bid_price
    instance_type                              = var.task_instance_type_xlarge
    ## Number of Core
    weighted_capacity = var.task_weight_capacity_xlarge
  }

  instance_type_configs {
    ebs_config {
      size                 = var.task_ebs_volume_size
      type                 = "gp2"
      volumes_per_instance = var.task_ebs_number
    }
    bid_price_as_percentage_of_on_demand_price = var.task_bid_price
    instance_type                              = var.task_instance_type_2xlarge
    weighted_capacity                          = var.task_weight_capacity_2xlarge
  }

  instance_type_configs {
    ebs_config {
      size                 = var.task_ebs_volume_size
      type                 = "gp2"
      volumes_per_instance = var.task_ebs_number
    }
    bid_price_as_percentage_of_on_demand_price = var.task_bid_price
    instance_type                              = var.task_instance_type_4xlarge
    weighted_capacity                          = var.task_weight_capacity_4xlarge
  }
}

#====================================================================================#
# https://aws.amazon.com/blogs/big-data/introducing-amazon-emr-managed-scaling-automatically-resize-clusters-to-lower-cost/
# https://docs.aws.amazon.com/emr/latest/APIReference/API_ComputeLimits.html
#
# -- Applicable to CORE + TASK
#====================================================================================#

resource "aws_emr_managed_scaling_policy" "auto-scaling" {
  cluster_id = aws_emr_cluster.cluster.id
  compute_limits {
    unit_type                       = var.autoscale_unit_type
    minimum_capacity_units          = var.autoscale_min_capacity_units
    maximum_capacity_units          = var.autoscale_max_capacity_units
    maximum_ondemand_capacity_units = var.autoscale_max_ondemand_capacity_units
    maximum_core_capacity_units     = var.autoscale_max_core_capacity_units
  }
}

#================#
#  Upload Object #
#================#
# resource "aws_s3_bucket_object" "bootstrap" {
#   for_each               = fileset("./userdata/bootstrap/", "**")
#   bucket                 = "${var.bucket_name}/emr/bootstrap"
#   key                    = each.value
#   source                 = "./userdata/bootstrap/${each.value}"
#   # etag                   = filemd5("./userdata/bootstrap/${each.value}")
#   # kms_key_id             = data.aws_kms_key.cmk_key.arn
#   # server_side_encryption = "aws:kms"
# }

# resource "aws_s3_bucket_object" "hive" {
#   for_each               = fileset("./userdata/hive/", "**")
#   bucket                 = "${var.bucket_name}/hive/script"
#   key                    = each.value
#   source                 = "./userdata/hive/${each.value}"
#   # etag                   = filemd5("./userdata/hive/${each.value}")
#   # kms_key_id             = data.aws_kms_key.cmk_key.arn
#   # server_side_encryption = "aws:kms"
# }
