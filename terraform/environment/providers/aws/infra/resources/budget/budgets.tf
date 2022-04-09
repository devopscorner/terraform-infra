# ==========================================================================
#  Resources: Budget / budget.tf (Budget Definition)
# --------------------------------------------------------------------------
#  Description
# --------------------------------------------------------------------------
#    - Name Budget
#    - Limit Budget (Number)
#    - Limit Unit (USD)
#    - Time Budget
#    - Alert Notification (Threshold)
# ==========================================================================

# --------------------------------------------------------------------------
#  Resources Tags
# --------------------------------------------------------------------------
locals {
  resources_tags = {
    Name          = "budget-${var.env[local.env]}",
    ResourceGroup = "${var.environment[local.env]}-BUD-INFRA"
  }
}

resource "aws_budgets_budget" "monthly_forcasted" {
  name              = "monthly_forcasted_100"
  budget_type       = "COST"
  limit_amount      = "100"
  limit_unit        = "USD"
  time_unit         = "MONTHLY"
  time_period_start = "2022-01-01_00:00"

  notification {
    comparison_operator        = "GREATER_THAN"
    threshold                  = 80
    threshold_type             = "PERCENTAGE"
    notification_type          = "FORECASTED"
    subscriber_email_addresses = ["support@devopscorner.id"]
  }

}

resource "aws_budgets_budget" "monthly_budget" {
  name              = "monthly_budget_300"
  budget_type       = "COST"
  limit_amount      = "300"
  limit_unit        = "USD"
  time_unit         = "MONTHLY"
  time_period_start = "2022-01-01_00:00"

  notification {
    comparison_operator        = "GREATER_THAN"
    threshold                  = 80
    threshold_type             = "PERCENTAGE"
    notification_type          = "ACTUAL"
    subscriber_email_addresses = ["support@devopscorner.id"]
  }

}
