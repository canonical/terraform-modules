# terraform-modules

[Terraform modules](https://developer.hashicorp.com/terraform/language/modules) are reusable, self-contained packages of Terraform configurations that encapsulate a set of resources with well-defined inputs and outputs. They provide a way to organize and reuse infrastructure code by abstracting away common patterns or configurations into reusable components. 

This repository contains Terraform modules designed specifically for deploying [Juju](https://juju.is/) charms using the [Terraform Juju Provider](https://registry.terraform.io/providers/juju/juju/latest/docs).

## Example

You can deploy a Synapse charm by creating a main.tf file like this:

```
module "synapse" {
  source = "github.com/canonical/terraform-modules.git//modules/k8s/synapse"

  juju_model_name = local.juju_model_name
}
```

