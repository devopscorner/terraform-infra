# ==========================================================================
#  Resources: Cloud9 / ssm.tf (AWS Systems Manager Agent)
# --------------------------------------------------------------------------
#  Description
# --------------------------------------------------------------------------
#    - SSM Configuration
# ==========================================================================

resource "aws_ssm_parameter" "cloud9_machine_ip" {
  name  = "cloud9_ip_allocation_id"
  type  = "String"
  value = aws_eip.cloud9_machine_ip.allocation_id
}

resource "aws_ssm_parameter" "cloud9_efs_az" {
  name  = "cloud9_efs_az"
  type  = "String"
  value = "${var.cloud9_efs_az[local.env]}"
}

resource "aws_ssm_parameter" "cloud9_efs" {
  name  = "cloud9_efs_id"
  type  = "String"
  value = aws_efs_file_system.cloud9_efs.id
}

resource "aws_ssm_parameter" "cloud9_efs_main_ap" {
  name  = "cloud9_efs_data_ap"
  type  = "String"
  value = aws_efs_access_point.cloud9_efs_main_ap.id
}

resource "aws_ssm_parameter" "cloud9_efs_docker_ap" {
  name  = "cloud9_efs_docker_ap"
  type  = "String"
  value = aws_efs_access_point.cloud9_efs_docker_ap.id
}

resource "aws_ssm_parameter" "cloud9_ssh_key" {
  name  = "cloud9_ssh_key"
  type  = "String"
  value = local.ssh_pubkey
}
