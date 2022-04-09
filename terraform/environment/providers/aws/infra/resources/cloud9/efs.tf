# ==========================================================================
#  Resources: Cloud9 / efs.tf (Elastic File System)
# --------------------------------------------------------------------------
#  Description
# --------------------------------------------------------------------------
#    - EFS Configuration
# ==========================================================================

resource "aws_efs_file_system" "cloud9_efs" {
  availability_zone_name = "${var.cloud9_efs_az[local.env]}"
  creation_token         = "cloud9_machine_files"

  lifecycle_policy {
    transition_to_ia = "AFTER_7_DAYS"
  }

  lifecycle_policy {
    transition_to_primary_storage_class = "AFTER_1_ACCESS"
  }

  lifecycle {
    prevent_destroy = true
  }

  tags = merge(local.tags, local.resources_tags)
}

resource "aws_efs_access_point" "cloud9_efs_main_ap" {
  file_system_id = aws_efs_file_system.cloud9_efs.id
  posix_user {
    uid = 1000
    gid = 1000
  }

  root_directory {
    creation_info {
      owner_uid   = 1000
      owner_gid   = 1000
      permissions = 0755
    }
    path = "/data"
  }
}

resource "aws_efs_access_point" "cloud9_efs_docker_ap" {
  file_system_id = aws_efs_file_system.cloud9_efs.id
  posix_user {
    uid = 0
    gid = 0
  }

  root_directory {
    creation_info {
      owner_uid   = 0
      owner_gid   = 0
      permissions = 0755
    }
    path = "/docker"
  }
}

resource "aws_efs_mount_target" "cloud9_efs_mount" {
  file_system_id = aws_efs_file_system.cloud9_efs.id
  ## Public Subnet
  # data.terraform_remote_state.core_state.outputs.ec2_public_1a[0]
  # data.terraform_remote_state.core_state.outputs.ec2_public_1b[0]
  subnet_id       = local.subnet_id
  security_groups = [aws_security_group.cloud9_efs_firewall.id]
}
