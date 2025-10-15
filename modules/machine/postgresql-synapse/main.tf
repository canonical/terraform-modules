terraform {
  required_version = ">= 1.6.6"
  required_providers {
    juju = {
      source  = "juju/juju"
      version = ">= 0.8"
    }
  }
}

resource "juju_application" "backups_s3_integrator" {
  name  = "postgresql-backups-s3-integrator"
  model = var.juju_model_name
  trust = true

  charm {
    name     = "s3-integrator"
    channel  = "latest/stable"
    series   = "jammy"
    revision = 13
  }

  config = {
    endpoint     = var.postgresql_backup_endpoint
    bucket       = var.postgresql_backup_bucket_name
    path         = var.postgresql_backup_path
    region       = var.postgresql_backup_region
    s3-uri-style = "path"
  }

  units = 1

  provisioner "local-exec" {
    # There's currently no way to wait for the charm to be idle, hence the sleep
    # https://github.com/juju/terraform-provider-juju/issues/202
    command = "sleep 180;$([ $(juju version | cut -d. -f1) = '3' ] && echo 'juju run' || echo 'juju run-action') ${self.name}/leader sync-s3-credentials access-key=${var.postgresql_backup_access_key} secret-key=${var.postgresql_backup_secret_key}"
  }
}

resource "juju_application" "postgresql" {
  name  = var.postgresql_application_name
  model = var.juju_model_name
  trust = true

  charm {
    name     = "postgresql"
    channel  = var.postgresql_charm_channel
    revision = var.postgresql_charm_revision
    series   = var.postgresql_charm_series
  }

  expose {}

  units = var.postgresql_charm_units
  config = {
    plugin_hstore_enable  = true
    plugin_pg_trgm_enable = true
  }

  constraints = var.postgresql_charm_constraints
}

resource "juju_integration" "s3_integrator_postgresql_k8s" {
  model = var.juju_model_name

  application {
    name = juju_application.backups_s3_integrator.name
  }

  application {
    name = juju_application.postgresql.name
  }
}

resource "juju_offer" "postgresql-juju-offer" {
  model            = var.juju_model_name
  application_name = juju_application.postgresql.name
  endpoint         = "database"
}

module "subordinates" {
  # tflint-ignore: terraform_module_pinned_source
  source                 = "git::ssh://git.launchpad.net/canonical-terraform-modules//subordinates?depth=1&ref=v3.0"
  juju_model             = var.juju_model_name
  applications_to_relate = [juju_application.postgresql.name, juju_application.backups_s3_integrator.name]
  subordinate_series     = "jammy"
  include_telegraf       = false
}
