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

  config = {
    database-name = var.postgresql_database_name
  }

  units = 2
}

resource "juju_application" "pgbouncer" {
  name  = "pgbouncer-${var.postgresql_database_name}"
  model = var.juju_model_name
  trust = true

  charm {
    name     = "pgbouncer"
    channel  = var.pgbouncer_charm_channel
    base     = var.pgbouncer_charm_base
    revision = var.pgbouncer_charm_revision
  }

  expose {}

  constraints = var.pgbouncer_charm_constraints
  units       = 0
}

resource "juju_integration" "postgresql_pgbouncer" {
  model = var.juju_model_name

  application {
    name = juju_application.pgbouncer.name
  }

  application {
    name = var.postgresql_application_name
  }
}

resource "juju_integration" "pgbouncer_data_integrator" {
  model = var.juju_model_name

  application {
    name = juju_application.pgbouncer.name
  }

  application {
    name = juju_application.data_integrator.name
  }
}

resource "juju_integration" "pgbouncer_tls_certificates" {
  count = var.enable_tls ? 1 : 0
  model = var.juju_model_name

  application {
    name = juju_application.pgbouncer.name
  }

  application {
    name = var.tls_application_name
  }
}
