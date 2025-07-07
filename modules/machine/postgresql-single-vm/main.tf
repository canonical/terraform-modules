resource "juju_machine" "postgresql" {
  model       = var.juju_model_name
  base        = "ubuntu@22.04"
  name        = var.placement
  constraints = var.constraints
}

resource "juju_application" "machine_postgresql" {
  name  = var.postgresql_application_name
  model = var.juju_model_name
  trust = true

  charm {
    name    = "postgresql"
    channel = var.postgresql_charm_channel
    base    = var.postgresql_charm_base
    revision = var.postgresql_charm_revision
  }
  expose {}
  config = var.postgresql_config
  machines = [juju_machine.postgresql.machine_id]
  storage_directives = var.postgresql_storage
  endpoint_bindings = var.postgresql_endpoints
}

resource "juju_application" "data_integrator" {
  name  = "data-integrator-${var.postgresql_database_name}"
  model = var.juju_model_name
  trust = true

  charm {
    name     = "data-integrator"
    channel  = var.data_integrator_charm_channel
    base     = var.data_integrator_charm_base
    revision = var.data_integrator_charm_revision
  }

  config = var.data_integrator_config
  machines = [juju_machine.postgresql.machine_id]
  endpoint_bindings = var.data_integrator_endpoints
}

resource "juju_application" "self_signed_certificates" {
  name  = "self-signed-certificates"
  model = var.juju_model_name

  charm {
    name     = "self-signed-certificates"
    channel  = var.self_signed_certificates_charm_channel
    revision = var.self_signed_certificates_charm_revision
    base     = var.self_signed_certificates_charm_base
  }

  config = var.certificate_config
  machines = [juju_machine.postgresql.machine_id]
  endpoint_bindings = var.self_signed_certificates_endpoints
}

resource "juju_application" "grafana_agent" {
  name  = "grafana-agent"
  model = var.juju_model_name

  charm {
    name     = "grafana-agent"
    channel  = var.grafana_agent_charm_channel
    revision = var.grafana_agent_charm_revision
    base     = var.grafana_agent_charm_base
  }
}

resource "juju_application" "backups_s3_integrator" {
  name  = "backups-s3-integrator"
  model = var.juju_model_name
  trust = true

  charm {
    name     = "s3-integrator"
    channel  = var.s3_integrator_charm_channel
    base     = var.s3_integrator_charm_base
    revision = var.s3_integrator_charm_revision
  }
  config = var.s3_integrator_config
  machines = [juju_machine.postgresql.machine_id]
  endpoint_bindings = var.s3_integrator_endpoints
}
