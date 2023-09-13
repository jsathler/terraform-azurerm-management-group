resource "azurerm_management_group" "root" {
  display_name = var.root_group_name
}

resource "azurerm_management_group" "tier1" {
  for_each                   = { for key, value in var.tier1_group_names : key => value }
  display_name               = each.key
  parent_management_group_id = azurerm_management_group.root.id
  subscription_ids           = each.value.subscription_ids
}

resource "azurerm_management_group" "tier2" {
  for_each                   = { for key, value in var.tier2_group_names : key => value }
  display_name               = each.key
  parent_management_group_id = azurerm_management_group.tier1[each.value.parent_management_group].id
  subscription_ids           = each.value.subscription_ids
}
