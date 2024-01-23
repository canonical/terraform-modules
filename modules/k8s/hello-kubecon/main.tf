resource "juju_model" "model" {
  name = var.juju_model_name
  lifecycle {
    prevent_destroy = true
  }
}

resource "juju_application" "hello-kubecon" {
  name  = var.hello-kubecon_application_name
  model = var.juju_model_name
  trust = true

  charm {
    name    = "hello-kubecon"
    channel = var.hello-kubecon_charm_channel
  }

  units = 1
}
