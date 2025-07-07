resource "juju_integration" "data-postgresql" {
  model    = var.juju_model_name
  application {
    name     = juju_application.machine_postgresql.name
    endpoint = "database"
  }
  application {
    name     = juju_application.data_integrator.name
    endpoint = "postgresql"
  }
}

resource "juju_integration" "certificates-postgresql" {
  model    = var.juju_model_name
  application {
    name     = juju_application.machine_postgresql.name
    endpoint = "certificates"
  }
  application {
    name     = juju_application.self_signed_certificates.name
    endpoint = "certificates"
  }
}

resource "juju_integration" "grafana-postgresql" {
  model    = var.juju_model_name
  application {
    name     = juju_application.machine_postgresql.name
    endpoint = "cos-agent"
  }
  application {
    name     = juju_application.grafana_agent.name
    endpoint = "cos-agent"
  }
}

resource "juju_integration" "s3_integrator_postgresql" {
  model = var.juju_model_name

  application {
    name = juju_application.backups_s3_integrator.name
  }

  application {
    name = juju_application.machine_postgresql.name
  }
}
