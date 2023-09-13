variable "root_group_name" {
  description = "The name of the root management group."
  type        = string
}

variable "tier1_group_names" {
  description = "The name of the tier1 management groups and subscription IDs. A list of subscription ID is optional (useful if you want to create the tier2 level and put subscriptions there)"
  type = map(object({
    subscription_ids = optional(list(string), null)
  }))
  default = {}
}

variable "tier2_group_names" {
  description = "The name of the tier2 management groups, subscription IDs and parent management group name. A list of subscription ID is optional (useful if you want to create the management groups only)"
  type = map(object({
    subscription_ids        = optional(list(string), null)
    parent_management_group = string
  }))
  default = {}
}
