<!-- BEGIN_TF_DOCS -->
# Azure Management Group Terraform module

Terraform module which creates Management Groups on Azure.

These types of resources are supported:

* [Azure Management Group](https://learn.microsoft.com/en-us/azure/governance/azure-management)

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.5.6 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | >= 3.70.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | >= 3.70.0 |

## Resources

| Name | Type |
|------|------|
| [azurerm_management_group.root](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/management_group) | resource |
| [azurerm_management_group.tier1](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/management_group) | resource |
| [azurerm_management_group.tier2](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/management_group) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_root_group_name"></a> [root\_group\_name](#input\_root\_group\_name) | The name of the root management group. | `string` | n/a | yes |
| <a name="input_tier1_group_names"></a> [tier1\_group\_names](#input\_tier1\_group\_names) | The name of the tier1 management groups and subscription IDs. A list of subscription ID is optional (useful if you want to create the tier2 level and put subscriptions there) | <pre>map(object({<br>    subscription_ids = optional(list(string), null)<br>  }))</pre> | `{}` | no |
| <a name="input_tier2_group_names"></a> [tier2\_group\_names](#input\_tier2\_group\_names) | The name of the tier2 management groups, subscription IDs and parent management group name. A list of subscription ID is optional (useful if you want to create the management groups only) | <pre>map(object({<br>    subscription_ids        = optional(list(string), null)<br>    parent_management_group = string<br>  }))</pre> | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_root_management_group_id"></a> [root\_management\_group\_id](#output\_root\_management\_group\_id) | Root Management group ID |
| <a name="output_tier1_management_group_ids"></a> [tier1\_management\_group\_ids](#output\_tier1\_management\_group\_ids) | Tier1 Management groups IDs |
| <a name="output_tier2_management_group_ids"></a> [tier2\_management\_group\_ids](#output\_tier2\_management\_group\_ids) | Tier2 Management groups IDs |

## Examples
```hcl
module "management-groups" {
  source          = "jsathler/management-group/azurerm"
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
More examples in ./examples folder
<!-- END_TF_DOCS -->