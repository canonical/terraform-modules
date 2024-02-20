resource "juju_application" "k8s_mysql" {
  name  = var.mysql_application_name
  model = var.juju_model_name
  trust = true

  charm {
    name    = "mysql-k8s"
    channel = var.mysql_charm_channel
  }

  units = 1
}
