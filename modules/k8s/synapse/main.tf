module "k8s_postgresql" {
  source = "github.com/canonical/terraform-modules.git//modules/k8s/postgresql"

  juju_model_name = var.juju_model_name
}

resource "juju_application" "k8s_synapse" {
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

resource "juju_integration" "k8s_synapse_k8s_postgresql" {
  model = var.juju_model_name

  application {
    name     = var.synapse_application_name
    endpoint = "database"
  }

  application {
    name     = module.k8s_postgresql.application_name
    endpoint = "database"
  }
}

