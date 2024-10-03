resource "juju_application" "k8s_mysql" {
  name  = var.mysql_app_name
  model = var.juju_model_name
  trust = true

  charm {
    name     = "mysql-k8s"
    channel  = var.mysql_charm_channel
    revision = var.mysql_charm_revision
    base     = var.mysql_charm_base
  }

  config = var.mysql_charm_config

  storage_directives = {
    database = var.mysql_storage_size
  }

  units       = var.mysql_charm_units
  constraints = var.mysql_charm_constraints
}
