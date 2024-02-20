variable "wordpress_application_name" {
  description = "Wordpress application name"
  type        = string
  default     = "wordpress"
}

variable "wordpress_charm_channel" {
  description = "Wordpress charm channel"
  type        = string
  default     = "latest/stable"
}

variable "juju_model_name" {
  description = "Juju model name"
  type        = string
}
