variable "juju_model_name" {
  description = "Juju model name"
  type        = string
}

variable "postgresql_application_name" {
  description = "Postgresql application name"
  type        = string
  default     = "postgresql-k8s"
}

variable "postgresql_charm_channel" {
  description = "Postgresql charm channel"
  type        = string
  default     = "latest/stable"
}

variable "postgresql_charm_revision" {
  description = "Postgresql charm revision"
  type        = number
}

variable "postgresql_charm_series" {
  description = "Postgresql charm series"
  type        = string
}

variable "postgresql_charm_units" {
  description = "Potgresql charm units number"
  type        = number
}

variable "postgresql_backup_endpoint" {
  description = "Postgresql backup bucket endpoint"
  type        = string
}

variable "postgresql_backup_path" {
  description = "Postgresql backup bucket path"
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
  sensitive   = true
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
