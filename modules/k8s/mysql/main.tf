resource "juju_model" "model" {
  name = var.juju_model_name
  lifecycle {
    prevent_destroy = true
  }
}

resource "juju_application" "k8s_mysql" {
  name  = var.mysql_application_name
  model = juju_model.model.name
  trust = true

  charm {
    name    = "mysql-k8s"
    channel = var.mysql_charm_channel
  }

  units = 1
}
