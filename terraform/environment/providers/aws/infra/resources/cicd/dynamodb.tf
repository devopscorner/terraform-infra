# ==========================================================================
#  Resources: CICD DynamoDB / dynamodb.tf (DynamoDB Terraform)
# --------------------------------------------------------------------------
#  Description
# --------------------------------------------------------------------------
#    - Resources Tags
#    - DynamoDB Configuration
# ==========================================================================

# --------------------------------------------------------------------------
#  Resources Tags
# --------------------------------------------------------------------------
locals {
  dynamodb_tags = {
    "Name"          = var.goapp_dynamodb_table,
    "ResourceGroup" = "${var.environment[local.env]}-DYN-GOAPP"
  }
}

############
# DynamoDB #
############
module "dynamodb" {

  source = "../../../../../../modules/providers/aws/officials/terraform-aws-dynamodb-table"

  name                = var.goapp_dynamodb_table
  hash_key            = "id"
  billing_mode        = "PROVISIONED"
  read_capacity       = 5
  write_capacity      = 5
  autoscaling_enabled = true

  autoscaling_read = {
    scale_in_cooldown  = 50
    scale_out_cooldown = 40
    target_value       = 70
    max_capacity       = 10
  }

  autoscaling_write = {
    scale_in_cooldown  = 50
    scale_out_cooldown = 40
    target_value       = 70
    max_capacity       = 10
  }

  autoscaling_indexes = {
    IDIndex = {
      read_max_capacity  = 30
      read_min_capacity  = 10
      write_max_capacity = 30
      write_min_capacity = 10
    },
    TitleIndex = {
      read_max_capacity  = 30
      read_min_capacity  = 10
      write_max_capacity = 30
      write_min_capacity = 10
    },
    AuthorIndex = {
      read_max_capacity  = 30
      read_min_capacity  = 10
      write_max_capacity = 30
      write_min_capacity = 10
    },
    YearIndex = {
      read_max_capacity  = 30
      read_min_capacity  = 10
      write_max_capacity = 30
      write_min_capacity = 10
    },
    CreatedAtIndex = {
      read_max_capacity  = 30
      read_min_capacity  = 10
      write_max_capacity = 30
      write_min_capacity = 10
    },
    UpdatedAtIndex = {
      read_max_capacity  = 30
      read_min_capacity  = 10
      write_max_capacity = 30
      write_min_capacity = 10
    }
  }

  attributes = [
    {
      name = "id"
      type = "S"
    },
    {
      name = "title"
      type = "S"
    },
    {
      name = "author"
      type = "S"
    },
    {
      name = "year"
      type = "S"
    },
    {
      name = "created_at"
      type = "S"
      # local-exec = {
      #   command = "date -u +%Y-%m-%dT%H:%M:%SZ"
      #   output  = "string"
      # }
    },
    {
      name = "updated_at"
      type = "S"
      # local-exec = {
      #   command = "date -u +%Y-%m-%dT%H:%M:%SZ"
      #   output  = "string"
      # }
    }
  ]

  global_secondary_indexes = [
    {
      name               = "IDIndex"
      hash_key           = "id"
      projection_type    = "INCLUDE"
      non_key_attributes = ["id"]
      write_capacity     = 10
      read_capacity      = 10
    },
    {
      name            = "TitleIndex"
      hash_key        = "title"
      range_key       = "year"
      projection_type = "ALL"
      write_capacity  = 10
      read_capacity   = 10
    },
    {
      name            = "AuthorIndex"
      hash_key        = "author"
      projection_type = "ALL"
      write_capacity  = 10
      read_capacity   = 10
    },
    {
      name            = "YearIndex"
      hash_key        = "year"
      projection_type = "ALL"
      write_capacity  = 10
      read_capacity   = 10
    },
    {
      name            = "CreatedAtIndex"
      hash_key        = "created_at"
      projection_type = "ALL"
      write_capacity  = 10
      read_capacity   = 10
    },
    {
      name            = "UpdatedAtIndex"
      hash_key        = "updated_at"
      projection_type = "ALL"
      write_capacity  = 10
      read_capacity   = 10
    }
  ]

  tags = merge(local.tags, local.dynamodb_tags)
}
