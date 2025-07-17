resource "juju_machine" "postgresql" {
  model       = var.juju_model_name
  base        = var.base
  name        = var.machine_name
  constraints = var.machine_constraints
}

module "postgresql" {
  juju_model_name  = var.juju_model_name
  # source           = "../terraform"
  source           = "github.com/canonical/postgresql-operator//terraform?ref=alutay/update_tf" # TODO: fix branch once PR#1052 is merged
  app_name         = var.postgresql_app_name
  channel          = var.postgresql_charm_channel
  revision         = var.postgresql_charm_revision
  base             = var.base
  units            = null
  machine          = tonumber(juju_machine.postgresql.machine_id)
  constraints      = var.postgresql_constraints
  storage          = var.postgresql_storage
}

