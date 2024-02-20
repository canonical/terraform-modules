resource "juju_model" "model" {
  name = var.juju_model_name
  lifecycle {
    prevent_destroy = true
  }
}

module "k8s_mysql" {
  source = "github.com/canonical/terraform-modules.git//modules/k8s/mysql"

  juju_model_name = juju_model.model.name
}

resource "juju_application" "k8s_wordpress" {
  name  = var.wordpress_application_name
  model = juju_model.model.name

  charm {
    name    = "wordpress-k8s"
    channel = var.wordpress_charm_channel
  }

  config = {
    blog_hostname    = var.wordpress_application_name
    initial_settings = <<EOF
    user_name: admin
    admin_email: devnull@example.com
    EOF
  }

  units = 1
}

resource "juju_integration" "k8s_wordpress_k8s_mysql" {
  model = juju_model.model.name

  application {
    name     = var.wordpress_application_name
    endpoint = "database"
  }

  application {
    name     = module.k8s_mysql.application_name
    endpoint = "database"
  }
}

