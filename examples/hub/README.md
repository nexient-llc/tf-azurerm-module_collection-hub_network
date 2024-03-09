# tf-azurerm-module_collection-hub_network

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | <= 1.5.5 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | ~> 3.77 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_hub_vnet"></a> [hub\_vnet](#module\_hub\_vnet) | ../.. | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_resource_names_map"></a> [resource\_names\_map](#input\_resource\_names\_map) | A map of key to resource\_name that will be used by tf-module-resource\_name to generate resource names | <pre>map(object({<br>    name       = string<br>    max_length = optional(number, 60)<br>    region     = optional(string, "eastus2")<br>  }))</pre> | `{}` | no |
| <a name="input_instance_env"></a> [instance\_env](#input\_instance\_env) | Number that represents the instance of the environment. | `number` | `0` | no |
| <a name="input_instance_resource"></a> [instance\_resource](#input\_instance\_resource) | Number that represents the instance of the resource. | `number` | `0` | no |
| <a name="input_logical_product_family"></a> [logical\_product\_family](#input\_logical\_product\_family) | (Required) Name of the product family for which the resource is created.<br>    Example: org\_name, department\_name. | `string` | `"launch"` | no |
| <a name="input_logical_product_service"></a> [logical\_product\_service](#input\_logical\_product\_service) | (Required) Name of the product service for which the resource is created.<br>    For example, backend, frontend, middleware etc. | `string` | `"network"` | no |
| <a name="input_class_env"></a> [class\_env](#input\_class\_env) | (Required) Environment where resource is going to be deployed. For example. dev, qa, uat | `string` | `"dev"` | no |
| <a name="input_network"></a> [network](#input\_network) | Attributes of virtual network to be created. | <pre>object({<br>    use_for_each    = bool<br>    address_space   = optional(list(string), ["10.0.0.0/16"])<br>    subnet_names    = optional(list(string), [])<br>    subnet_prefixes = optional(list(string), [])<br>    bgp_community   = optional(string, null)<br>    ddos_protection_plan = optional(object(<br>      {<br>        enable = bool<br>        id     = string<br>      }<br>    ), null)<br>    dns_servers                                           = optional(list(string), [])<br>    nsg_ids                                               = optional(map(string), {})<br>    route_tables_ids                                      = optional(map(string), {})<br>    subnet_delegation                                     = optional(map(map(any)), {})<br>    subnet_enforce_private_link_endpoint_network_policies = optional(map(bool), {})<br>    subnet_enforce_private_link_service_network_policies  = optional(map(bool), {})<br>    subnet_service_endpoints                              = optional(map(list(string)), {})<br>    tags                                                  = optional(map(string), {})<br>    tracing_tags_enabled                                  = optional(bool, false)<br>    tracing_tags_prefix                                   = optional(string, "")<br>  })</pre> | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | Azure region to use | `string` | n/a | yes |
| <a name="input_firewall"></a> [firewall](#input\_firewall) | Attributes to create a azure firewall | <pre>object({<br>    logs_destinations_ids = list(string)<br>    subnet_cidr           = optional(string)<br>    additional_public_ips = optional(list(object(<br>      {<br>        name                 = string,<br>        public_ip_address_id = string<br>    })), [])<br>    application_rule_collections = optional(list(object(<br>      {<br>        name     = string,<br>        priority = number,<br>        action   = string,<br>        rules = list(object(<br>          { name             = string,<br>            source_addresses = list(string),<br>            source_ip_groups = list(string),<br>            target_fqdns     = list(string),<br>            protocols = list(object(<br>              { port = string,<br>            type = string }))<br>          }<br>        ))<br>    })))<br>    custom_diagnostic_settings_name = optional(string)<br>    custom_firewall_name            = optional(string)<br>    dns_servers                     = optional(string)<br>    extra_tags                      = optional(map(string))<br>    firewall_private_ip_ranges      = optional(list(string))<br>    ip_configuration_name           = optional(string)<br>    network_rule_collections = optional(list(object({<br>      name     = string,<br>      priority = number,<br>      action   = string,<br>      rules = list(object({<br>        name                  = string,<br>        source_addresses      = list(string),<br>        source_ip_groups      = optional(list(string)),<br>        destination_ports     = list(string),<br>        destination_addresses = list(string),<br>        destination_ip_groups = optional(list(string)),<br>        destination_fqdns     = optional(list(string)),<br>        protocols             = list(string)<br>      }))<br>    })))<br>    public_ip_zones = optional(list(number))<br>    sku_tier        = string<br>    zones           = optional(list(number))<br>  })</pre> | `null` | no |
| <a name="input_firewall_policy_rule_collection_group_priority"></a> [firewall\_policy\_rule\_collection\_group\_priority](#input\_firewall\_policy\_rule\_collection\_group\_priority) | (Required) The priority of the Firewall Policy Rule Collection Group. The range is 100-65000. | `number` | n/a | yes |
| <a name="input_application_rule_collection"></a> [application\_rule\_collection](#input\_application\_rule\_collection) | (Optional) The Application Rule Collection to use in this Firewall Policy Rule Collection Group. | <pre>list(object({<br>    name     = string<br>    action   = string<br>    priority = number<br>    rule = list(object({<br>      name        = string<br>      description = optional(string)<br>      protocols = optional(list(object({<br>        type = string<br>        port = number<br>      })))<br>      http_headers = optional(list(object({<br>        name  = string<br>        value = string<br>      })))<br>      source_addresses      = optional(list(string))<br>      source_ip_groups      = optional(list(string))<br>      destination_addresses = optional(list(string))<br>      destination_urls      = optional(list(string))<br>      destination_fqdns     = optional(list(string))<br>      destination_fqdn_tags = optional(list(string))<br>      terminate_tls         = optional(bool)<br>      web_categories        = optional(list(string))<br>    }))<br>  }))</pre> | `[]` | no |
| <a name="input_network_rule_collection"></a> [network\_rule\_collection](#input\_network\_rule\_collection) | (Optional) The Network Rule Collection to use in this Firewall Policy Rule Collection Group. | <pre>list(object({<br>    name     = string<br>    action   = string<br>    priority = number<br>    rule = list(object({<br>      name                  = string<br>      description           = optional(string)<br>      protocols             = list(string)<br>      destination_ports     = list(string)<br>      source_addresses      = optional(list(string))<br>      source_ip_groups      = optional(list(string))<br>      destination_addresses = optional(list(string))<br>      destination_fqdns     = optional(list(string))<br>    }))<br>  }))</pre> | `[]` | no |
| <a name="input_nat_rule_collection"></a> [nat\_rule\_collection](#input\_nat\_rule\_collection) | (Optional) The NAT Rule Collection to use in this Firewall Policy Rule Collection Group. | <pre>list(object({<br>    name     = string<br>    action   = string<br>    priority = number<br>    rule = list(object({<br>      name               = string<br>      description        = optional(string)<br>      protocols          = list(string)<br>      source_addresses   = optional(list(string))<br>      source_ip_groups   = optional(list(string))<br>      destination_ports  = optional(list(string))<br>      translated_address = optional(string)<br>      translated_port    = number<br>      translated_fqdn    = optional(string)<br>    }))<br>  }))</pre> | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_resource_group"></a> [resource\_group](#output\_resource\_group) | Attributes of the resource group created for the hub VNet |
| <a name="output_network"></a> [network](#output\_network) | Attributes of the hub VNet |
| <a name="output_firewall"></a> [firewall](#output\_firewall) | Attributes of the firewall created for the hub VNet |
| <a name="output_firewall_policy"></a> [firewall\_policy](#output\_firewall\_policy) | Attributes of the firewall policy created for the hub VNet |
| <a name="output_firewall_policy_rule_collection_group"></a> [firewall\_policy\_rule\_collection\_group](#output\_firewall\_policy\_rule\_collection\_group) | Attributes of the firewall policy rule collection created for the hub VNet |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
