variable "az_subscription_id" {
  type = string
}

variable "az_tenant_id" {
  type = string
}

variable "resource_group_name" {
  description = "Name of the resource group"
  default     = "community-quickstart"
}

variable "location" {
  description = "Location of the resources"
  default     = "West Europe"
}
