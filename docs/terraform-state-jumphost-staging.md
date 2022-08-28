## Output

```json
terraform output
-----
arn = {
  "instance_arn" = "arn:aws:ec2:ap-southeast-1:YOUR_AWS_ACCOUNT:instance/[INSTANCE_ID]"
  "security_group_arn" = "arn:aws:ec2:ap-southeast-1:YOUR_AWS_ACCOUNT:security-group/sg-[SECURITY_GROUP_ID]"
}
instance = {
  "private_ipv4" = "10.32.40.125"
  "public_dns" = "ec2-[ELASTIC_IP_PUBLIC].ap-southeast-1.compute.amazonaws.com"
  "public_ipv4" = "[ELASTIC_IP_PUBLIC]"
  "ssh_access_dns" = "ssh ec2-user@ec2-[ELASTIC_IP_PUBLIC].ap-southeast-1.compute.amazonaws.com"
  "ssh_access_ip" = "ssh ec2-user@[ELASTIC_IP_PUBLIC]"
  "subnet_id" = "subnet-02ddb146bdbfb57e9"
  "vpc_id" = "vpc-074d5cb113db55d7e"
}
route53 = {
  "dns_name" = "jumphost-staging.[YOUR_DOMAIN_NAME]"
  "fqdn" = "jumphost-staging.[YOUR_DOMAIN_NAME]"
  "records" = toset([
    "jumphost-elb-staging-[ELB_NUMBER].ap-southeast-1.elb.amazonaws.com",
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
