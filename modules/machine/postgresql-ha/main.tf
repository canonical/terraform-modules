resource "juju_application" "backups_s3_integrator" {
  name  = "backups-s3-integrator"
  model = var.juju_model_name
  trust = true

  charm {
    name     = "s3-integrator"
    channel  = var.s3_integrator_charm_channel
    base     = var.s3_integrator_charm_base
    revision = var.s3_integrator_charm_revision
  }

  config = {
    endpoint     = var.postgresql_backup_endpoint
    bucket       = var.postgresql_backup_bucket_name
    path         = var.juju_model_name
    region       = var.postgresql_backup_region
    s3-uri-style = "path"
  }

  units = 1

  provisioner "local-exec" {
    # There's currently no way to wait for the charm to be idle, hence the sleep
    # https://github.com/juju/terraform-provider-juju/issues/202
    command = "sleep 900;$([ $(juju version | cut -d. -f1) = '3' ] && echo 'juju run' || echo 'juju run-action') ${self.name}/leader sync-s3-credentials access-key=${var.postgresql_backup_access_key} secret-key=${var.postgresql_backup_secret_key}"
  }
}

resource "juju_application" "postgresql" {
  name  = "postgresql"
  model = var.juju_model_name
  trust = true

  charm {
    name     = "postgresql"
    channel  = var.postgresql_charm_channel
    revision = var.postgresql_charm_revision
    base     = var.postgresql_charm_base
  }

  expose {}

  units       = var.postgresql_charm_units
  constraints = var.postgresql_charm_constraints
}

resource "juju_integration" "s3_integrator_postgresql" {
  model = var.juju_model_name

  application {
    name = juju_application.backups_s3_integrator.name
  }

  application {
    name = juju_application.postgresql.name
  }
}

resource "juju_offer" "postgresql_juju_offer" {
  count = var.postgresql_old_offer ? 0 : 1

  model            = var.juju_model_name
  application_name = juju_application.postgresql.name
  endpoint         = "database"
}

resource "juju_offer" "postgresql_juju_db_offer" {
  count = var.postgresql_old_offer ? 1 : 0

  model            = var.juju_model_name
  application_name = juju_application.postgresql.name
  endpoint         = "db"
}

resource "juju_integration" "telegraf_postgresql" {
  model = var.juju_model_name

  application {
    name     = "postgresql"
    endpoint = "db-admin"
  }
  application {
    name     = "telegraf"
    endpoint = "postgresql"
  }
}

resource "juju_application" "tls_certificates" {
  count = var.enable_tls ? 1 : 0
  name  = "tls-certificates"
  model = var.juju_model_name

  charm {
    name     = "tls-certificates-operator"
    channel  = var.tls_certificates_charm_channel
    revision = var.tls_certificates_charm_revision
  }

  config = {
    generate-self-signed-certificates = "true"
    ca-common-name                    = "${var.juju_model_name} CA"
  }

  units = 1
}

resource "juju_integration" "postgresql_tls_certificates" {
  count = var.enable_tls ? 1 : 0
  model = var.juju_model_name

  application {
    name = juju_application.postgresql.name
  }
  application {
    name = "tls-certificates"
  }
}