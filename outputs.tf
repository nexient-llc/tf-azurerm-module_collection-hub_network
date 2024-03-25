// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

output "resource_group_id" {
  description = "resource group id"
  value       = module.resource_group.id
}

output "resource_group_name" {
  description = "resource group name"
  value       = module.resource_group.name
}

output "vnet_names" {
  value       = module.network.vnet_names
  description = "Map of vnet names where key in input key in network map and value is name of vnet that got created."
}

output "vnet_ids" {
  value       = module.network.vnet_ids
  description = "Map of vnet names where key in input key in network map and value is id of vnet that got created."
}

output "vnet_subnets" {
  value       = module.network.vnet_subnets
  description = "Map of vnet names where key in input key in network map and value is id of the subnets that got created."
}

output "vnet_locations" {
  value       = module.network.vnet_locations
  description = "Map of vnet names where key in input key in network map and value is location of vnet that got created."
}

output "vnet_address_spaces" {
  value       = module.network.vnet_address_spaces
  description = "Map of vnet names where key in input key in network map and value is address of vnet that got created."
}

output "vnet_subnet_name_id_map" {
  value       = module.network.vnet_subnet_name_id_map
  description = "Outputs a subnet name to ID map for each Vnet"
}

output "firewall_ids" {
  value       = module.firewall.firewall_ids
  description = "Firewall generated ids"
}

output "firewall_names" {
  value       = module.firewall.firewall_names
  description = "Firewall names"
}

output "firewall_private_ip_addresses" {
  value       = module.firewall.private_ip_addresses
  description = "Firewall private IPs"
}

output "firewall_public_ip_addresses" {
  value       = module.firewall.public_ip_addresses
  description = "Firewall public IPs"
}

output "firewall_subnet_ids" {
  value       = module.firewall.subnet_ids
  description = "IDs of the subnet attached to the firewall"
}

output "firewall_policy_id" {
  description = "The ID of the Firewall Policy."
  value       = module.firewall_policy.id
}

output "firewall_policy_child_policies" {
  description = "The child policies of the Firewall Policy."
  value       = module.firewall_policy.child_policies
}

output "firewall_policy_firewalls" {
  description = "A list of references to Azure Firewalls that this Firewall Policy is associated with."
  value       = module.firewall_policy.firewalls
}

output "firewall_policy_rule_collection_groups" {
  description = "A list of references to Azure Firewall Rule Collection Groups that this Firewall Policy is associated with."
  value       = module.firewall_policy.rule_collection_groups
}

output "firewall_policy_name" {
  description = "The name of the Firewall Policy."
  value       = module.firewall_policy.name
}

output "firewall_policy_rule_collection_group_name" {
  value       = module.firewall_policy_rule_collection_group.firewall_policy_rule_collection_group_name
  description = "Value of the Azure Firewall policy rule collection group name"
}

output "firewall_policy_rule_collection_group_id" {
  value       = module.firewall_policy_rule_collection_group.firewall_policy_rule_collection_group_id
  description = "The ID of the Firewall Policy Rule Collection Group."
}
