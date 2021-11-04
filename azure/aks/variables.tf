variable "az_subscription_id" {
  type    = string
  default = "50c24abd-f872-4a3b-9f65-419800dda5eb"
}

variable "az_tenant_id" {
  type    = string
  default = "57a3f6ea-7e70-4260-acb4-e06ce452f695"
}


variable "resource_group_name" {
  description = "Name of the resource group"
  default     = "community-quickstart"
}

variable "location" {
  description = "Location of the resources"
  default     = "West Europe"
}
