# ==========================================================================
#  Resources: MWAA / mwaa.tf (MWAA Terraform)
# --------------------------------------------------------------------------
#  Description
# --------------------------------------------------------------------------
#    - VPC References
#    - Route53 Record
#    - Security Group
#    - MWAA Configuration
# ==========================================================================

# --------------------------------------------------------------------------
#  Resources Tags
# --------------------------------------------------------------------------
locals {
  resources_tags = {
    Name          = "${var.mwaa_name}",
    ResourceGroup = "${var.environment[local.env]}-MWAA-DEVOPSCORNER"
  }
}

#########################
# MWAA (Apache Airflow) #
#########################
data "aws_vpc" "selected" {
  id = data.terraform_remote_state.core_state.outputs.vpc_id
}

data "aws_subnet_ids" "all" {
  vpc_id = data.aws_vpc.selected.id
}

module "mwaa" {
  source = "../../../../../../modules/providers/aws/community/terraform-aws-mwaa"

  create_iam_role       = true
  create_s3_bucket      = true
  create_security_group = true
  region                = var.aws_region
  vpc_id                = data.aws_vpc.selected.id

  subnet_ids = [
    ## Public Subnet
    # data.terraform_remote_state.core_state.outputs.ec2_public_1a[0],
    # data.terraform_remote_state.core_state.outputs.ec2_public_1b[0],
    ## Private Subnet (MUST)
    data.terraform_remote_state.core_state.outputs.ec2_private_1a[0],
    data.terraform_remote_state.core_state.outputs.ec2_private_1b[0],
    data.terraform_remote_state.core_state.outputs.ec2_private_1c[0]
  ]

  namespace                     = var.mwaa_namespace
# environment                   = var.env[local.env]
  stage                         = var.mwaa_stage
  name                          = var.mwaa_name
  airflow_version               = var.airflow_version
  dag_s3_path                   = var.dag_s3_path
  environment_class             = var.environment_class
  min_workers                   = var.min_workers
  max_workers                   = var.max_workers
  webserver_access_mode         = var.webserver_access_mode
  dag_processing_logs_enabled   = var.dag_processing_logs_enabled
  dag_processing_logs_level     = var.dag_processing_logs_level
  scheduler_logs_enabled        = var.scheduler_logs_enabled
  scheduler_logs_level          = var.scheduler_logs_level
  task_logs_enabled             = var.task_logs_enabled
  task_logs_level               = var.task_logs_level
  webserver_logs_enabled        = var.webserver_logs_enabled
  webserver_logs_level          = var.webserver_logs_level
  worker_logs_enabled           = var.worker_logs_enabled
  worker_logs_level             = var.worker_logs_level
  airflow_configuration_options = var.airflow_configuration_options

  tags = merge(local.tags, local.resources_tags)

  context = module.this.context
}
