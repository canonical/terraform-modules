variable "juju_model_name" {
  description = "Juju model name"
  type        = string
}

variable "mysql_charm_channel" {
  description = "MySQL K8s charm channel"
  type        = string
  default     = "8.0/edge"
}

variable "mysql_charm_revision" {
  description = "MySQL K8s charm revision"
  type        = number
  default     = 197
}

variable "mysql_charm_base" {
  description = "MySQL K8s charm base"
  type        = string
  default     = "ubuntu@22.04"
}

variable "mysql_charm_units" {
  description = "MySQL K8s charm units number"
  type        = number
  default     = 3
}

variable "mysql_backup_endpoint" {
  description = "MySQL K8s backup bucket endpoint"
  type        = string
}

variable "mysql_backup_bucket_name" {
  description = "MySQL K8s backup bucket name"
  type        = string
}

variable "mysql_backup_region" {
  description = "MySQL K8s backup bucket region"
  type        = string
}

variable "mysql_backup_access_key" {
  description = "MySQL K8s backup bucket access key"
  type        = string
}

variable "mysql_backup_secret_key" {
  description = "MySQL K8s backup bucket secret key"
  type        = string
  sensitive   = true
}

variable "mysql_charm_constraints" {
  # provider sets inconsistent constraint result with architecture (e.g. `arch=amd64`)
  # user of the module needs to set the variable to the current arch value.
  # See: https://github.com/juju/terraform-provider-juju/issues/344
  type    = string
  default = ""
}

variable "mysql_storage_size" {
  description = "MySQL storage size"
  type        = string
  default     = "10G"
}

variable "mysql_charm_config" {
  description = "MySQL charm configuration"
  type        = map(string)
  default     = {}
}

variable "mysql_router_charm_channel" {
  description = "MySQL router charm channel"
  type        = string
  default     = "8.0/stable"
}

variable "mysql_router_charm_revision" {
  description = "MySQL router charm revision"
  type        = number
  default     = 155
}

variable "data_integrator_enabled" {
  description = "Enable data integrator for external connectivity"
  type        = bool
  default     = false
}

variable "data_integrator_charm_channel" {
  description = "Data integrator charm channel"
  type        = string
  default     = "latest/stable"
}

variable "data_integrator_charm_revision" {
  description = "Data integrator charm revision"
  type        = number
  default     = 41
}

variable "data_integrator_database_name" {
  description = "Data integrator database name"
  type        = string
  default     = ""
  validation {
    condition     = var.data_integrator_enabled == false || var.data_integrator_database_name != ""
    error_message = "data_integrator_database_name must be set if data_integrator_enabled is true."
  }
}

variable "enable_tls" {
  description = "Enable/enforce TLS through self-signed certificates"
  type        = bool
  default     = true
}

variable "s3_integrator_charm_channel" {
  description = "S3 integrator charm channel"
  type        = string
  default     = "latest/stable"
}

variable "s3_integrator_charm_revision" {
  description = "S3 integrator charm revision"
  type        = number
  default     = 32
}

variable "s3_integrator_charm_base" {
  description = "S3 integrator charm base"
  type        = string
  default     = "ubuntu@22.04"
}

variable "self_signed_certificates_charm_channel" {
  description = "Self Signed Certificates Operator charm channel"
  type        = string
  default     = "latest/stable"
}

variable "self_signed_certificates_charm_revision" {
  description = "Self Signed Operator charm revision"
  type        = number
  default     = 155
}
