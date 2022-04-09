# ==========================================================================
#  Resources: Cloud9 / outputs.tf (Outputs Terraform)
# --------------------------------------------------------------------------
#  Description
# --------------------------------------------------------------------------
#    - Cloud9 Machine Information
#    - Cloud9 Roles ARN
#    - Cloud9 EFS Mounting
# ==========================================================================

output "cloud9_machine_info" {
  value = {
    vpc_id              = data.aws_vpc.selected.id
    subnet_id           = local.subnet_id
    public_ipv4         = aws_eip.cloud9_machine_ip.public_ip
    efs_id              = aws_efs_file_system.cloud9_efs.id
    access_point_data   = aws_efs_access_point.cloud9_efs_main_ap.id
    access_point_docker = aws_efs_access_point.cloud9_efs_docker_ap.id
    ssh_access          = "ssh ec2-user@${aws_eip.cloud9_machine_ip.public_ip}"
    bucket_name         = aws_s3_bucket.cloud9_main_bucket.bucket
  }
}

output "roles" {
  value = {
    spot_fleet_role = aws_iam_role.cloud9_spot_fleet_role.arn,
    ec2_iam_role    = aws_iam_role.cloud9_machine_role.arn,
    admin_role      = aws_iam_role.cloud9_machine_admin_role.arn
  }
}

output "efs_mount" {
  value = {
    home   = "sudo mount -t efs -o az=${var.cloud9_efs_az[local.env]},tls,accesspoint=${aws_efs_access_point.cloud9_efs_main_ap.id} ${aws_efs_file_system.cloud9_efs.id}:/ /home/ec2-user"
    docker = "sudo mount -t efs -o az=${var.cloud9_efs_az[local.env]},tls,accesspoint=${aws_efs_access_point.cloud9_efs_docker_ap.id} ${aws_efs_file_system.cloud9_efs.id}:/ /dockerlib"
  }
}
