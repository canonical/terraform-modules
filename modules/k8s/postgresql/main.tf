resource "juju_model" "model" {
  name = var.juju_model_name
  lifecycle {
    prevent_destroy = true
  }
}

resource "juju_application" "k8s_postgresql" {
  name  = var.postgresql_application_name
  model = juju_model.model.name
  trust = true

  charm {
    name    = "postgresql-k8s"
    channel = var.postgresql_charm_channel
  }

  units = 1
}
