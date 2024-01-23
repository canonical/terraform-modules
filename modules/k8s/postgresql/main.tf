resource "juju_model" "model" {
  name = var.juju_model_name
  lifecycle {
    prevent_destroy = true
  }
}

resource "juju_application" "postgresql" {
  name  = var.postgresql_application_name
  model = var.juju_model_name
  trust = true

  charm {
    name    = "postgresql-k8s"
    channel = var.postgresql_charm_channel
  }

  units = 1
}
