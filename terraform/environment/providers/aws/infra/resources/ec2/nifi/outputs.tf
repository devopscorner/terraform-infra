# ==========================================================================
#  Services: Nifi / outputs.tf (Output Terraform)
# --------------------------------------------------------------------------
#  Description
# --------------------------------------------------------------------------
#    - Return value ec2 module
# ==========================================================================

output "arn" {
  value = {
    instance_arn       = aws_instance.nifi.arn,
    keypair_arn        = aws_key_pair.nifi_ssh_key.arn,
    security_group_arn = aws_security_group.nifi.arn,
  }
}

output "instance" {
  value = {
    bucket_name    = local.bucket_name
    private_ipv4   = "${aws_eip.nifi.private_ip}"
    public_dns     = "${aws_eip.nifi.public_dns}"
    public_ipv4    = "${aws_eip.nifi.public_ip}"
    ssh_access_dns = "${var.ami_os}" == "aws-linux" ? "ssh ec2-user@${aws_eip.nifi.public_dns}" : "ssh ubuntu@${aws_eip.nifi.public_dns}"
    ssh_access_ip  = "${var.ami_os}" == "aws-linux" ? "ssh ec2-user@${aws_eip.nifi.public_ip}" : "ssh ubuntu@${aws_eip.nifi.public_ip}"
    subnet_id      = local.subnet_id
    vpc_id         = data.aws_vpc.selected.id
  }
}

output "route53" {
  value = {
    dns_name = aws_route53_record.nifi.name
    fqdn     = aws_route53_record.nifi.fqdn
    records  = aws_route53_record.nifi.records
    type     = aws_route53_record.nifi.type
    zone_id  = aws_route53_record.nifi.zone_id
  }
}
