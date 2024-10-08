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
    endpoint     = var.mysql_backup_endpoint
    bucket       = var.mysql_backup_bucket_name
    path         = var.juju_model_name
    region       = var.mysql_backup_region
    s3-uri-style = "path"
  }

  units = 1

  provisioner "local-exec" {
    # There's currently no way to wait for the charm to be idle, hence the wait-for
    # https://github.com/juju/terraform-provider-juju/issues/202
    command = "juju wait-for application ${self.name} --query='name==\"${self.name}\" && status==\"blocked\"'; $([ $(juju version | cut -d. -f1) = '3' ] && echo 'juju run' || echo 'juju run-action') ${self.name}/leader sync-s3-credentials access-key=${var.mysql_backup_access_key} secret-key=${var.mysql_backup_secret_key}"
  }
}

resource "juju_application" "mysql" {
  name  = "mysql"
  model = var.juju_model_name
  trust = true

  charm {
    name     = "mysql"
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

resource "juju_integration" "s3_integrator_mysql" {
  model = var.juju_model_name

  application {
    name = juju_application.backups_s3_integrator.name
  }

  application {
    name = juju_application.mysql.name
  }
}

resource "juju_offer" "mysql_juju_offer" {
  model            = var.juju_model_name
  application_name = juju_application.mysql.name
  endpoint         = "database"
}

resource "juju_application" "mysql_router" {
  count = var.data_integrator_enabled ? 1 : 0
  name  = "mysql-router"
  model = var.juju_model_name

  charm {
    name     = "mysql-router"
    channel  = var.mysql_router_charm_channel
    revision = var.mysql_router_charm_revision
  }
}

resource "juju_application" "data_integrator" {
  count = var.data_integrator_enabled ? 1 : 0
  name  = "data-integrator"
  model = var.juju_model_name

  charm {
    name     = "data-integrator"
    channel  = var.data_integrator_charm_channel
    revision = var.data_integrator_charm_revision
  }

  config = {
    database-name = var.data_integrator_database_name
  }

  units = 1
}

resource "juju_application" "self_signed_certificates" {
  count = var.enable_tls ? 1 : 0
  name  = "self-signed-certificates"
  model = var.juju_model_name

  charm {
    name     = "self-signed-certificates"
    channel  = var.self_signed_certificates_charm_channel
    revision = var.self_signed_certificates_charm_revision
  }

  config = {
    ca-common-name = "${var.juju_model_name} CA"
  }

  units = 1
}

resource "juju_integration" "mysql_self_signed_certificates" {
  count = var.enable_tls ? 1 : 0
  model = var.juju_model_name

  application {
    name = juju_application.mysql.name
  }
  application {
    name = juju_application.self_signed_certificates[0].name
  }
}

resource "juju_integration" "mysql_mysql_router" {
  count = var.data_integrator_enabled ? 1 : 0
  model = var.juju_model_name

  application {
    name     = juju_application.mysql.name
    endpoint = "database"
  }
  application {
    name     = juju_application.mysql_router[0].name
    endpoint = "backend-database"
  }
}

resource "juju_integration" "mysql_router_data_integrator" {
  count = var.data_integrator_enabled ? 1 : 0
  model = var.juju_model_name

  application {
    name     = juju_application.mysql_router[0].name
    endpoint = "database"
  }
  application {
    name     = juju_application.data_integrator[0].name
    endpoint = "mysql"
  }
}
