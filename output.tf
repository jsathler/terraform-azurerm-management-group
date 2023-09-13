output "root_management_group_id" {
  description = "Root Management group ID"
  value       = { (azurerm_management_group.root.display_name) = azurerm_management_group.root.id }
}

output "tier1_management_group_ids" {
  description = "Tier1 Management groups IDs"
  value       = { for key, value in azurerm_management_group.tier1 : key => value.id }
}

output "tier2_management_group_ids" {
  description = "Tier2 Management groups IDs"
  value       = { for key, value in azurerm_management_group.tier2 : key => value.id }
}
