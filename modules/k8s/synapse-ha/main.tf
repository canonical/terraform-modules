resource "juju_application" "synapse" {
  name  = var.synapse_application_name
  model = var.juju_model_name
  trust = true

  charm {
    name     = "synapse"
    channel  = var.synapse_charm_channel
    revision = var.synapse_charm_revision
    series   = var.synapse_charm_series
  }

  config = {
    server_name                        = var.synapse_server_name
    enable_mjolnir                     = var.synapse_enable_mjolnir
    public_baseurl                     = var.synapse_public_baseurl
    notif_from                         = var.synapse_notif_from
    allow_public_rooms_over_federation = var.allow_public_rooms_over_federation
    backup_passphrase                  = var.synapse_backup_passphrase
    enable_irc_bridge                  = var.synapse_enable_irc_bridge
    irc_bridge_admins                  = var.synapse_irc_bridge_admins
  }

  units = var.synapse_units
}

resource "juju_application" "nginx_ingress_integrator" {
  name  = "nginx-ingress-integrator"
  model = var.juju_model_name
  trust = true

  charm {
    name     = "nginx-ingress-integrator"
    channel  = var.nginx_ingress_integrator_charm_channel
    revision = var.nginx_ingress_integrator_charm_revision
  }

  config = {
    service-hostname = var.synapse_nginx_ingress_integrator_charm_service_hostname
    tls-secret-name  = var.nginx_ingress_integrator_charm_tls_secret_name
  }

  units = 1
}

resource "juju_integration" "synapse_nginx_ingress_integrator" {
  model = var.juju_model_name

  application {
    name     = var.synapse_application_name
    endpoint = "nginx-route"
  }

  application {
    name     = juju_application.nginx_ingress_integrator.name
    endpoint = "nginx-route"
  }
}

resource "juju_application" "smtp_integrator" {
  name  = "smtp-integrator"
  model = var.juju_model_name

  charm {
    name     = "smtp-integrator"
    channel  = var.smtp_charm_channel
    revision = var.smtp_charm_revision
    series   = var.smtp_charm_series
  }

  config = {
    auth_type          = "plain"
    transport_security = "tls"
    host               = var.smtp_host
    port               = var.smtp_port
    user               = var.smtp_user
    password           = var.smtp_pass
  }
  units = 1
}

resource "juju_integration" "synapse_smtp" {
  model = var.juju_model_name

  application {
    name     = juju_application.synapse.name
    endpoint = "smtp"
  }

  application {
    name     = juju_application.smtp_integrator.name
    endpoint = "smtp-legacy"
  }
}

resource "juju_integration" "synapse_saml_integrator" {
  count = var.saml_integrator_offer_url != "" ? 1 : 0
  model = var.juju_model_name

  application {
    name     = var.synapse_application_name
    endpoint = "saml"
  }

  application {
    offer_url = var.saml_integrator_offer_url
  }
}

resource "juju_integration" "grafana_dashboard" {
  count = var.grafana_dashboard_offer_url != "" ? 1 : 0
  model = var.juju_model_name

  application {
    name     = var.synapse_application_name
    endpoint = "grafana-dashboard"
  }

  application {
    offer_url = var.grafana_dashboard_offer_url
  }
}

resource "juju_integration" "prometheus_scrape" {
  count = var.prometheus_scrape_offer_url != "" ? 1 : 0
  model = var.juju_model_name

  application {
    name     = var.synapse_application_name
    endpoint = "metrics-endpoint"
  }

  application {
    offer_url = var.prometheus_scrape_offer_url
  }
}

