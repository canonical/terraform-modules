module "postgresql" {
  source = "github.com/terraform-modules.git//modules/k8s/postgresql"

  juju_model_name = local.juju_model_name
  cloud_name      = local.cloud_name
}

resource "juju_model" "model" {
  name = var.juju_model_name
  lifecycle {
    prevent_destroy = true
  }
}

resource "juju_application" "synapse" {
  name  = var.synapse_application_name
  model = var.juju_model_name
  trust = true

  charm {
    name    = "synapse"
    channel = var.synapse_charm_channel
  }

  config = {
    server_name = var.synapse_application_name
  }

  units = 1
}

resource "juju_integration" "synapse_postgresql" {
  model = var.juju_model_name

  application {
    name     = var.synapse_application_name
    endpoint = "database"
  }

  application {
    name     = juju_application.postgresql.name
    endpoint = "database"
  }
}

