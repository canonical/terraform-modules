resource "juju_application" "k8s_postgresql" {
  name  = var.postgresql_application_name
  model = var.juju_model_name
  trust = true

  charm {
    name    = "postgresql-k8s"
    channel = var.postgresql_charm_channel
  }

  units = 1
}
