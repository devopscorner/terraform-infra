# ==========================================================================
#  Resources: MWAA / outputs.tf (Outputs Terraform)
# --------------------------------------------------------------------------
#  Description
# --------------------------------------------------------------------------
#    - S3 Bucket ARN
#    - MWAA ARN
#    - Logging Configuration
#    - Security Group Id
#    - Execution Role ARN
#    - MWAA Creation Date
#    - MWAA Service Role ARN
#    - MWAA Status Environment
#    - MWAA Tags Resources
#    - MWAA Web Server URL
# ==========================================================================

output "s3_bucket_arn" {
  value       = module.mwaa.s3_bucket_arn
  description = "ARN of S3 bucket"
}

output "arn" {
  value       = module.mwaa.arn
  description = "ARN of MWAA environment"
}

output "logging_configuration" {
  value       = module.mwaa.logging_configuration
  description = "The Logging Configuration of the MWAA Environment"
}

output "security_group_ids" {
  description = "IDs of the MWAA Security Group(s)"
  value       = module.mwaa.security_group_ids
}

output "execution_role_arn" {
  description = "IAM Role ARN for Amazon MWAA Execution Role"
  value       = module.mwaa.execution_role_arn
}

output "created_at" {
  description = "The Created At date of the Amazon MWAA Environment"
  value       = module.mwaa.created_at
}

output "service_role_arn" {
  description = "The Service Role ARN of the Amazon MWAA Environment"
  value       = module.mwaa.service_role_arn
}

output "status" {
  description = "The status of the Amazon MWAA Environment"
  value       = module.mwaa.status
}

output "tags_all" {
  description = "A map of tags assigned to the resource, including those inherited from the provider for the Amazon MWAA Environment"
  value       = module.mwaa.tags_all
}

output "webserver_url" {
  description = "The webserver URL of the Amazon MWAA Environment"
  value       = module.mwaa.webserver_url
}
