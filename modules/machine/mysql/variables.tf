variable "mysql_application_name" {
  description = "MySQL application name"
  type        = string
  default     = "mysql"
}

variable "mysql_charm_channel" {
  description = "MySQL charm channel"
  type        = string
  default     = "8.0/stable"
}
