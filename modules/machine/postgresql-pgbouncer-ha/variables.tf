variable "postgresql_application_name" {
  description = "PostgreSQL application name"
  type        = string
  default     = "postgresql"
}

variable "postgresql_charm_channel" {
  description = "PostgreSQL charm channel"
  type        = string
  default     = "14/stable"
}

variable "postgresql_charm_base" {
  description = "Postgresql charm base"
  type        = string
  default     = "ubuntu@22.04"
}

variable "postgresql_charm_revision" {
  description = "Postgresql charm revision"
  type        = number
}

variable "postgresql_endpoints" {
  description = "Postgresql endpoint bindings"
}

variable "juju_model_name" {
  description = "Juju model name"
  type        = string
}

variable "total_units" {
  description = "Total postgresql units"
}

variable "postgresql_config" {
  description = "Configuration for postgresql"
}

variable "placement" {
  description = "Placement of the application"
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

variable "data_integrator_config" {
  description = "Data integrator config"
}

variable "data_integrator_endpoints" {
  description = "Data integrator endpoint bindings"
}

variable "postgresql_database_name" {
  description = "Database name"
  type = string
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

variable "self_signed_certificates_charm_base" {
  description = "Self Signed Certificates charm base"
  type        = string
  default     = "ubuntu@22.04"
}

variable "self_signed_certificates_endpoints" {
  description = "Self Signed Certificates endpoint bindings"
}

variable "certificate_config" {
  description = "Self Signed config"
}

variable "constraints_postgresql" {
  description = "Machine constraints"
}

variable "constraints_pgbouncer" {
  description = "Machine constraints"
}

variable "postgresql_space" {
  description = "Postgresql space"
}

variable "oam_space" {
  description = "OAM space"
}

variable "grafana_agent_charm_channel" {
  description = "Grafana Agent charm channel"
  type        = string
  default     = "latest/stable"
}

variable "grafana_agent_charm_revision" {
  description = "Grafana Agent charm revision"
  type        = number
  default     = 113
}

variable "grafana_agent_charm_base" {
  description = "Grafana Agent charm base"
  type        = string
  default     = "ubuntu@22.04"
}

variable "grafana_agent_endpoints" {
  description = "Grafana agent endpoint bindings"
}

variable "pgbouncer_charm_channel" {
  description = "PgBouncer charm channel"
  type        = string
  default     = "1/stable"
}

variable "pgbouncer_charm_revision" {
  description = "PgBouncer charm revision"
  type        = number
  default     = 642
}

variable "pgbouncer_charm_base" {
  description = "PgBouncer charm base"
  type        = string
  default     = "ubuntu@22.04"
}

variable "pgbouncer_config" {
  description = "Pgbouncer configuration"
}

variable "pgbouncer_endpoints" {
  description = "Pgbouncer endpoint bindings"
}

variable "s3_integrator_charm_channel" {
  description = "S3 integrator charm channel"
  type        = string
  default     = "latest/stable"
}

variable "s3_integrator_charm_revision" {
  description = "S3 integrator charm revision"
  type        = number
  default     = 145
}

variable "s3_integrator_charm_base" {
  description = "S3 integrator charm base"
  type        = string
  default     = "ubuntu@22.04"
}

variable "s3_integrator_config" {
  description = "S3 integrator configuration"
}

variable "s3_integrator_endpoints" {
  description = "s3 integrator endpoint bindings"
}

variable "postgresql_storage" {
  description = "Storage description for postgresql"
}

variable "hacluster_charm_channel" {
  description = "hacluster charm channel"
  type        = string
  default     = "2.4/stable"
}

variable "hacluster_charm_revision" {
  description = "hacluster charm revision"
  type        = number
  default     = 131
}

variable "hacluster_charm_base" {
  description = "hacluster charm base"
  type        = string
  default     = "ubuntu@22.04"
}

variable "hacluster_endpoints" {
  description = "hacluster endpoint bindings"
}