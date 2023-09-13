# Azure Management Group Terraform module

Terraform module which creates Management Groups on Azure.

These types of resources are supported:

* [Azure Management Group](https://learn.microsoft.com/en-us/azure/governance/azure-management)

## Terraform versions

Terraform 1.5.6 and newer.

## Usage

```hcl
module "management-groups" {
  source              = "jsathler/management-group/azurerm"
  root_group_name = "Example"
  tier1_group_names = {
    Core = {
      subscription_ids = [local.shared_subscription_id]
    }
    DevTest = {
      subscription_ids = [local.devtest_subscription_id]
    }
    Prd = {
      subscription_ids = [local.prd_subscription_id]
    }
    Sandbox       = {}
    Decomissioned = {}
  }
}
```

More samples in examples folder