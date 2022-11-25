# ==========================================================================
#  Resources: RDS nifidb / dns.tf (DNS RDS)
# --------------------------------------------------------------------------
#  Description
# --------------------------------------------------------------------------
#    - Zone ID (DNS)
#    - Route53 Record
# ==========================================================================
# ------------------------------------
#  New Zone ID (DNS)
# ------------------------------------
## Create Zone ID (if not exist)
# resource "aws_route53_zone" "dns_private" {
#   name    = "${var.dns_url[local.env]}"
#   tags = {
#     "Department" = "DEVOPS"
#     "Name"       = "${var.dns_url[local.env]}"
#   }
#   comment = "DevOpsCorner PROD Domain Environment"
#   dynamic "vpc" {
#     for_each = toset(var.vpc_list)
#     content {
#       vpc_id     = vpc.value
#       vpc_region = "ap-southeast-1"
#     }
#   }
# }

## Use DNS Name from New Created Zone ID (if not exist)
# locals {
#   domain      = "${module.db.db_instance_name}-${var.env[local.env]}.${aws_route53_zone.dns_private.name}"
#   domain_name = trimsuffix(local.domain, ".")
# }

# resource "aws_route53_record" "emrdb" {
#   zone_id = aws_route53_zone.dns_private.zone_id
#   name    = local.domain_name
#   type    = "CNAME"
#   ttl     = 300
#   records = ["${module.db.db_instance_address}"]
# }
# ------------------------------------

# ------------------------------------
#  Existing Zone ID (DNS)
# ------------------------------------
locals {
  domain      = "${module.db.db_instance_name}-${var.env[local.env]}.${var.dns_url[local.env]}"
  domain_name = trimsuffix(local.domain, ".")
}

resource "aws_route53_record" "emrdb" {
  zone_id = "${var.dns_zone[local.env]}"
  name    = local.domain_name
  type    = "CNAME"
  ttl     = 300
  records = ["${module.db.db_instance_address}"]
}
# ------------------------------------