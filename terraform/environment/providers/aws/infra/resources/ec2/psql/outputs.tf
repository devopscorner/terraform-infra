# ==========================================================================
#  Resources: EC2 PostgreSQL / outputs.tf (Output Terraform)
# --------------------------------------------------------------------------
#  Description
# --------------------------------------------------------------------------
#    - Return value ec2 module
# ==========================================================================

output "arn" {
  value = {
    instance_arn       = aws_instance.psql.arn,
    keypair_arn        = aws_key_pair.psql_ssh_key.arn,
    security_group_arn = aws_security_group.psql.arn,
  }
}

output "instance" {
  value = {
    bucket_name    = local.bucket_name
    private_ipv4   = "${aws_eip.psql.private_ip}"
    public_dns     = "${aws_eip.psql.public_dns}"
    public_ipv4    = "${aws_eip.psql.public_ip}"
    ssh_access_dns = "${var.ami_os}" == "aws-linux" ? "ssh ec2-user@${aws_eip.psql.public_dns}" : "ssh ubuntu@${aws_eip.psql.public_dns}"
    ssh_access_ip  = "${var.ami_os}" == "aws-linux" ? "ssh ec2-user@${aws_eip.psql.public_ip}" : "ssh ubuntu@${aws_eip.psql.public_ip}"
    subnet_id      = local.subnet_id
    vpc_id         = data.aws_vpc.selected.id
  }
}

# output "route53" {
#   value = {
#     dns_name = aws_route53_record.psql.name
#     fqdn     = aws_route53_record.psql.fqdn
#     records  = aws_route53_record.psql.records
#     type     = aws_route53_record.psql.type
#     zone_id  = aws_route53_record.psql.zone_id
#   }
# }
