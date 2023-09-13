locals {
  shared_subscription_id  = ""
  devtest_subscription_id = ""
  prd_subscription_id     = ""
}

provider "azurerm" {
  features {}
}

module "management-groups" {
  source          = "../"
  root_group_name = "Example"
  tier1_group_names = {
    Core = {
      #   subscription_ids = [local.shared_subscription_id]
    }
    Corp          = {}
    Sandbox       = {}
    Decomissioned = {}
  }

  tier2_group_names = {
    Prd = {
      #   subscription_ids = [local.shared_subscription_id]
      parent_management_group = "Corp"
    }
    DevTest = {
      #   subscription_ids = [local.devtest_subscription_id]
      parent_management_group = "Corp"
    }

  }
}

output "management-groups" {
  value = module.management-groups
}
