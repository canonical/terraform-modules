variable "juju_model_name" {
  description = "Juju model name"
  type        = string
}

variable "postgresql_charm_channel" {
  description = "Postgresql charm channel"
  type        = string
  default     = "latest/edge"
}

variable "postgresql_charm_revision" {
  description = "Postgresql charm revision"
  type        = number
  default     = 413
}

variable "postgresql_charm_base" {
  description = "Postgresql charm base"
  type        = string
  default     = "ubuntu@22.04"
}

variable "postgresql_charm_units" {
  description = "Postgresql charm units number"
  type        = number
  default     = 3
}

variable "postgresql_backup_endpoint" {
  description = "Postgresql backup bucket endpoint"
  type        = string
}

variable "postgresql_backup_bucket_name" {
  description = "Postgresql backup bucket name"
  type        = string
}

variable "postgresql_backup_region" {
  description = "Postgresql backup bucket region"
  type        = string
}

variable "postgresql_backup_access_key" {
  description = "Postgresql backup bucket access key"
  type        = string
}

variable "postgresql_backup_secret_key" {
  description = "Postgresql backup bucket secret key"
  type        = string
  sensitive   = true
}

variable "postgresql_charm_constraints" {
  type    = string
  default = ""
}

variable "postgresql_old_offer" {
  type    = bool
  default = false
}

variable "enable_tls" {
  type    = bool
  default = true
}

variable "s3_integrator_charm_channel" {
  description = "S3 integrator charm channel"
  type        = string
  default     = "latest/edge"
}

variable "s3_integrator_charm_revision" {
  description = "S3 integrator charm revision"
  type        = number
  default     = 22
}

variable "s3_integrator_charm_base" {
  description = "S3 integrator charm base"
  type        = string
  default     = "ubuntu@22.04"
}

variable "tls_certificates_charm_channel" {
  description = "TLS Certificates Operator charm channel"
  type        = string
  default     = "latest/stable"
}

variable "tls_certificates_charm_revision" {
  description = "TLS Certificates Operator charm revision"
  type        = number
  default     = 22
}