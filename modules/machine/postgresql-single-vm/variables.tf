variable "juju_model_name" {
  description = "Juju model name"
  type        = string
  nullable    = false
}

variable "base" {
  description = "Juju machine and all charms base"
  type        = string
  default     = "ubuntu@22.04"
}

variable "machine_name" {
  description = "Name for the machine resource"
  type        = string
  default     = "pg_single_vm"
}

variable "machine_constraints" {
  description = "Machine constraints"
  type        = string
  default     = ""
}

variable "postgresql_app_name" {
  description = "PostgreSQL application name"
  type        = string
  default     = "postgresql2"
}

variable "postgresql_charm_channel" {
  description = "PostgreSQL charm channel"
  type        = string
  default     = "14/stable"
}

variable "postgresql_charm_revision" {
  description = "Postgresql charm revision"
  type        = number
  default     = null
}

variable "postgresql_constraints" {
  description = "Machine constraints"
  type        = string
  default     = "arch=amd64"
}

variable "postgresql_storage" {
  description = "Storage directive"
  type        = map(string)
  default     = {}
}
