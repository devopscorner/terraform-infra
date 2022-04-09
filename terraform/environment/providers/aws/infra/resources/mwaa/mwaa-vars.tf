# ==========================================================================
#  Resources: MWAA / mwaa-vars.tf (Spesific Environment)
# --------------------------------------------------------------------------
#  Description
# --------------------------------------------------------------------------
#    - Input Variable for Environment Variables
# ==========================================================================

# ------------------------------------
#  MWAA
# ------------------------------------
variable "mwaa_name" {
  type        = string
  description = "MWAA Name"
  default     = "mwaa"
}

variable "mwaa_namespace" {
  type        = string
  description = "MWAA Namespace"
  default     = "emr"
}

variable "mwaa_stage" {
  type        = string
  description = "MWAA Stage"
  default     = null
}

variable "availability_zones" {
  type        = list(string)
  description = "List of availability zones for VPC subnets"
  default     = ["ap-southeast-1a", "ap-southeast-1b"]
}

variable "webserver_access_mode" {
  type        = string
  description = "Specifies whether the webserver should be accessible over the internet or via your specified VPC. Possible options: PRIVATE_ONLY (default) and PUBLIC_ONLY."
  default     = "PRIVATE_ONLY"
}

variable "airflow_configuration_options" {
  description = "Airflow override options"
  type        = any
  default = {
    "core.default_task_retries" = 16
  }
}

variable "airflow_version" {
  type        = string
  description = "Airflow version of the MWAA environment, will be set by default to the latest version that MWAA supports."
  default     = "2.0.2"
}

variable "dag_s3_path" {
  type        = string
  description = "The relative path to the DAG folder on your Amazon S3 storage bucket."
  default     = "dags"
}

variable "environment_class" {
  type        = string
  description = "Environment class for the cluster. Possible options are mw1.small, mw1.medium, mw1.large."
  default     = "mw1.medium"
}

variable "dag_processing_logs_enabled" {
  type        = bool
  description = "Enabling or disabling the collection of logs for processing DAGs"
  default     = true
}

variable "dag_processing_logs_level" {
  type        = string
  description = "DAG processing logging level. Valid values: CRITICAL, ERROR, WARNING, INFO, DEBUG"
  default     = "INFO"
}

variable "scheduler_logs_enabled" {
  type        = bool
  description = "Enabling or disabling the collection of logs for the schedulers"
  default     = true
}

variable "scheduler_logs_level" {
  type        = string
  description = "Schedulers logging level. Valid values: CRITICAL, ERROR, WARNING, INFO, DEBUG"
  default     = "INFO"
}

variable "task_logs_enabled" {
  type        = bool
  description = "Enabling or disabling the collection of logs for DAG tasks"
  default     = true
}

variable "task_logs_level" {
  type        = string
  description = "DAG tasks logging level. Valid values: CRITICAL, ERROR, WARNING, INFO, DEBUG"
  default     = "INFO"
}

variable "webserver_logs_enabled" {
  type        = bool
  description = "Enabling or disabling the collection of logs for the webservers"
  default     = true
}

variable "webserver_logs_level" {
  type        = string
  description = "Webserver logging level. Valid values: CRITICAL, ERROR, WARNING, INFO, DEBUG"
  default     = "INFO"
}

variable "worker_logs_enabled" {
  type        = bool
  description = "Enabling or disabling the collection of logs for the workers"
  default     = true
}

variable "worker_logs_level" {
  type        = string
  description = "Workers logging level. Valid values: CRITICAL, ERROR, WARNING, INFO, DEBUG"
  default     = "INFO"
}

variable "max_workers" {
  type        = number
  description = "The maximum number of workers that can be automatically scaled up. Value needs to be between 1 and 25"
  default     = 10
}

variable "min_workers" {
  type        = number
  description = "The minimum number of workers that you want to run in your environment."
  default     = 1
}
