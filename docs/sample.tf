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
