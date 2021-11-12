variable "az_subscription_id" {
  type = string
}

variable "az_tenant_id" {
  type = string
}

variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
  default     = "otomi-quickstart-rg"
}

variable "location" {
  description = "Location of the resources"
}

variable "cluster_name" {
  type    = string
  default = "otomi-quickstart"
}