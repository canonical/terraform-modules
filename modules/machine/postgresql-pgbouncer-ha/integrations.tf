resource "juju_integration" "pgbouncer-postgresql" {
  model    = var.juju_model_name
  application {
    name     = juju_application.machine_postgresql.name
    endpoint = "database"
  }
  application {
    name     = juju_application.pgbouncer.name
    endpoint = "backend-database"
  }
}

resource "juju_integration" "pgbouncer-data" {
  model    = var.juju_model_name
  application {
    name     = juju_application.pgbouncer.name
    endpoint = "database"
  }
  application {
    name     = juju_application.data_integrator.name
    endpoint = "postgresql"
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

resource "juju_integration" "grafana-pgbouncer" {
  model    = var.juju_model_name
  application {
    name     = juju_application.pgbouncer.name
    endpoint = "cos-agent"
  }
  application {
    name     = juju_application.grafana_agent.name
    endpoint = "cos-agent"
  }
}

resource "juju_integration" "grafana-data" {
  model    = var.juju_model_name
  application {
    name     = juju_application.grafana_agent.name
    endpoint = "juju-info"
  }
  application {
    name     = juju_application.data_integrator.name
    endpoint = "juju-info"
  }
}

resource "juju_integration" "hacluster-data" {
  model    = var.juju_model_name
  application {
    name     = juju_application.hacluster.name
    endpoint = "juju-info"
  }
  application {
    name     = juju_application.data_integrator.name
    endpoint = "juju-info"
  }
}

resource "juju_integration" "hacluster-pgbouncer" {
  model    = var.juju_model_name
  application {
    name     = juju_application.hacluster.name
    endpoint = "ha"
  }
  application {
    name     = juju_application.pgbouncer.name
    endpoint = "ha"
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
