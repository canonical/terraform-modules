resource "juju_application" "k8s_hello_kubecon" {
  name  = var.hello_kubecon_application_name
  model = var.juju_model_name
  trust = true

  charm {
    name    = "hello-kubecon"
    channel = var.hello_kubecon_charm_channel
  }

  units = 1
}
