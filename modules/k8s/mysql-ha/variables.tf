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

variable "enable_tls" {
  type    = bool
  default = true
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
