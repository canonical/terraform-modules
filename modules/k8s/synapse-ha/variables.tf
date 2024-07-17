variable "synapse_application_name" {
  description = "Synapse application name"
  type        = string
  default     = "synapse"
}

variable "synapse_charm_channel" {
  description = "Synapse charm channel"
  type        = string
  default     = "latest/stable"
}

variable "synapse_charm_revision" {
  description = "Synapse charm revision"
  type        = number
}

variable "synapse_charm_constraints" {
  description = "Synapse charm juju constraints"
  type        = string
}

variable "synapse_server_name" {
  description = "Synapse server name. Unrelated to NGINX service_hostname."
  type        = string
}

variable "synapse_enable_mjolnir" {
  description = "Configures whether to enable Mjolnir - moderation tool for Matrix."
  type        = bool
  default     = true
}

variable "synapse_enable_irc_bridge" {
  description = "Configures whether to enable IRC Bridge - The IRC bridging service."
  type        = bool
  default     = false
}

variable "synapse_irc_bridge_admins" {
  description = "Configures users who will be allowed to administrate the IRC Bridge."
  type        = string
}

variable "synapse_public_baseurl" {
  description = "The public-facing base URL that clients use to access this Homeserver."
  type        = string
}

variable "synapse_notif_from" {
  description = "Defines the \"From\" address to use when sending emails."
  type        = string
}

variable "synapse_units" {
  description = "Synapse number of units. Default: 1."
  type        = number
  default     = 1
}

variable "synapse_backup_passphrase" {
  description = "Defines the passphrase to use to encrypt backups."
  type        = string
  sensitive   = true
  # An empty string will not allow creating or restoring backups.
  # It cannot be set to null (see https://github.com/juju/terraform-provider-juju/issues/394)
  default = ""
}

variable "juju_model_name" {
  description = "Juju model name"
  type        = string
}

variable "synapse_nginx_ingress_integrator_charm_service_hostname" {
  description = "Synapse Nginx ingress integrator service hostname"
  type        = string
}

variable "nginx_ingress_integrator_charm_channel" {
  description = "Nginx ingress integrator charm channel"
  type        = string
  default     = "latest/stable"
}

variable "nginx_ingress_integrator_charm_revision" {
  description = "Nginx ingress integrator charm revision"
  type        = number
}

variable "nginx_ingress_integrator_charm_tls_secret_name" {
  description = "Nginx ingress integrator TLS secret name"
  type        = string
}

variable "grafana_dashboard_offer_url" {
  description = "Grafana dashboard offer URL"
  type        = string
  default     = ""
}

variable "prometheus_scrape_offer_url" {
  description = "Prometheus scrape dashboard offer URL"
  type        = string
  default     = ""
}

variable "saml_integrator_offer_url" {
  description = "SAML Integrator offer URL"
  type        = string
  default     = ""
}

variable "cloud_name" {
  description = "K8S cluster name"
  type        = string
}

variable "smtp_charm_channel" {
  description = "smtp-integrator charm channel"
  type        = string
}

variable "smtp_charm_revision" {
  description = "smtp-integrator charm revision"
  type        = number
}

variable "smtp_charm_series" {
  description = "smtp-integrator charm series"
  type        = string
  default     = "jammy"
}

variable "smtp_host" {
  description = "The hostname of the SMTP host used for sending emails."
  type        = string
  default     = "smtp-services.canonical.com"
}

variable "smtp_pass" {
  description = "The password if the SMTP server requires authentication."
  type        = string
  sensitive   = true
}

variable "smtp_port" {
  description = "The port of the SMTP server used for sending emails."
  type        = number
  default     = 465
}

variable "smtp_user" {
  description = "The username if the SMTP server requires authentication."
  type        = string
}

variable "proxy_pass" {
  description = "The password if the proxy requires authentication."
  type        = string
  sensitive   = true
  default     = ""
}

variable "proxy_user" {
  description = "The username if the proxy requires authentication."
  type        = string
  default     = ""
}

variable "proxy_scheme" {
  description = "Scheme (either http or https) to use for the proxy."
  type        = string
  default     = "http"
}

variable "proxy_port" {
  description = "Port the proxy server."
  type        = number
  default     = 3128
}

variable "proxy_hostname" {
  description = "Hostname of the proxy server."
  type        = string
  default     = "squid.internal"
}

variable "allow_public_rooms_over_federation" {
  description = "Allows any other homeserver to fetch the server's public rooms directory via federation."
  type        = bool
  default     = false
}

