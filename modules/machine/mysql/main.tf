resource "juju_model" "model" {
  name = var.juju_model_name
  lifecycle {
    prevent_destroy = true
  }
}

resource "juju_application" "machine_mysql" {
  name  = var.mysql_application_name
  model = juju_model.model.name
  trust = true

  charm {
    name    = "mysql"
    channel = var.mysql_charm_channel
  }

  units = 1
}
