# ==========================================================================
#  Resources: Airflow / elb.tf (Classic LoadBalancer)
# --------------------------------------------------------------------------
#  Description
# --------------------------------------------------------------------------
#    - ELB Tags
#    - ELB Listener (Port, Protocol)
#    - ELB Healthcheck
# ==========================================================================

# --------------------------------------------------------------------------
#  Resources Tags
# --------------------------------------------------------------------------
locals {
  elb_tags = {
    Name          = "${var.ec2_name}-elb-${var.env[local.env]}",
    ResourceGroup = "${var.environment[local.env]}-ELB-AIRFLOW"
  }
}

resource "aws_elb" "airflow" {
  name    = "${var.ec2_name}-elb-${var.env[local.env]}"
  subnets = [
    ## Public Subnet
    data.terraform_remote_state.core_state.outputs.ec2_public_1a[0],
    data.terraform_remote_state.core_state.outputs.ec2_public_1b[0],
    data.terraform_remote_state.core_state.outputs.ec2_public_1c[0]
  ]
  security_groups = ["${aws_security_group.airflow.id}"]

  listener {
    instance_port     = 80
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }

  listener {
    instance_port     = 8080
    instance_protocol = "tcp"
    lb_port           = 8080
    lb_protocol       = "tcp"
  }

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    target              = "HTTP:80/"
    interval            = 30
  }

  instances                   = ["${aws_instance.airflow.id}"]
  cross_zone_load_balancing   = true
  idle_timeout                = 400
  connection_draining         = true
  connection_draining_timeout = 400

  tags = merge(local.tags, local.elb_tags)
}
