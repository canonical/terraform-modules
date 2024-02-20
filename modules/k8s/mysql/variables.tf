variable "mysql_application_name" {
  description = "MySQL application name"
  type        = string
  default     = "mysql-k8s"
}

variable "mysql_charm_channel" {
  description = "MySQL charm channel"
  type        = string
  default     = "8.0/stable"
}

variable "juju_model_name" {
  description = "Juju model name"
  type        = string
}
