variable "juju_model_name" {
  description = "Juju model name"
  type        = string
}

variable "mysql_app_name" {
  description = "MySQL application name"
  type        = string
  default     = "mysql-k8s"
}

variable "mysql_charm_channel" {
  description = "MySQL K8s charm channel"
  type        = string
  default     = "8.0/stable"
}

variable "mysql_charm_revision" {
  description = "MySQL K8s charm revision"
  type        = number
  default     = 180
}

variable "mysql_charm_base" {
  description = "MySQL K8s charm base"
  type        = string
  default     = "ubuntu@22.04"
}

variable "mysql_charm_units" {
  description = "MySQL K8s charm units number"
  type        = number
  default     = 1
}

variable "mysql_charm_constraints" {
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
