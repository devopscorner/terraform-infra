## Output

```json
terraform output
-----
arn = {
  "instance_arn" = "arn:aws:ec2:ap-southeast-1:YOUR_AWS_ACCOUNT:instance/[INSTANCE_ID]"
  "security_group_arn" = "arn:aws:ec2:ap-southeast-1:YOUR_AWS_ACCOUNT:security-group/sg-[SECURITY_GROUP_ID]"
}
instance = {
  "private_ipv4" = "10.48.40.125"
  "public_dns" = "ec2-[ELASTIC_IP_PUBLIC].ap-southeast-1.compute.amazonaws.com"
  "public_ipv4" = "[ELASTIC_IP_PUBLIC]"
  "ssh_access_dns" = "ssh ec2-user@ec2-[ELASTIC_IP_PUBLIC].ap-southeast-1.compute.amazonaws.com"
  "ssh_access_ip" = "ssh ec2-user@[ELASTIC_IP_PUBLIC]"
  "subnet_id" = "subnet-06d437c81e5f07fe6"
  "vpc_id" = "vpc-0793476ecc1775586"
}
route53 = {
  "dns_name" = "jumphost-prod.[YOUR_DOMAIN_NAME]"
  "fqdn" = "jumphost-prod.[YOUR_DOMAIN_NAME]"
  "records" = toset([
    "jumphost-elb-prod-[ELB_NUMBER].ap-southeast-1.elb.amazonaws.com",
  ])
  "type" = "CNAME"
  "zone_id" = "ZONE_ID"
}
```

## State

```json
terraform state list
-----
data.aws_subnet_ids.all
data.aws_vpc.selected
data.terraform_remote_state.core_state
aws_eip.jumphost
aws_elb.jumphost
aws_iam_role.this
aws_instance.jumphost
aws_route53_record.jumphost
aws_security_group.jumphost
```
