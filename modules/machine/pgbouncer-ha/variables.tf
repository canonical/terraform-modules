variable "juju_model_name" {
  description = "Juju model name"
  type        = string
}

variable "postgresql_application_name" {
  description = "Postgresql application name"
  type        = string
  default     = "postgresql"
}

variable "postgresql_database_name" {
  description = "Postgresql database name"
  type        = string
}

variable "tls_application_name" {
  description = "TLS application name"
  type        = string
  default     = "tls-certificates"
}

variable "enable_tls" {
  type    = bool
  default = false
}

variable "pgbouncer_charm_constraints" {
  type    = string
  default = ""
}

variable "data_integrator_charm_channel" {
  description = "Data Integrator charm channel"
  type        = string
  default     = "latest/stable"
}

variable "data_integrator_charm_revision" {
  description = "Data Integrator charm revision"
  type        = number
  default     = 27
}

variable "data_integrator_charm_base" {
  description = "Data Integrator charm base"
  type        = string
  default     = "ubuntu@22.04"
}

variable "pgbouncer_charm_channel" {
  description = "PgBouncer charm channel"
  type        = string
  default     = "1/edge"
}

variable "pgbouncer_charm_revision" {
  description = "PgBouncer charm revision"
  type        = number
  default     = 184
}

variable "pgbouncer_charm_base" {
  description = "PgBouncer charm base"
  type        = string
  default     = "ubuntu@22.04"
}