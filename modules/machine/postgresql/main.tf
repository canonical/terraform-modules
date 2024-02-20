resource "juju_application" "machine_postgresql" {
  name  = var.postgresql_application_name
  model = var.juju_model_name
  trust = true

  charm {
    name    = "postgresql"
    channel = var.postgresql_charm_channel
  }

  config = {
    plugin_hstore_enable  = true
    plugin_pg_trgm_enable = true
  }

  units = 1
}
