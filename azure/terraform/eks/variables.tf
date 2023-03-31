###Vars for resources

variable "resource_group_name" {
  type        = string
  description = "RG name in Azure"
  default     = "otomi"
}
variable "location" {
  type        = string
  description = "Resources location in Azure"
  default     = "eastus"
}
variable "cluster_name" {
  type        = string
  description = "AKS name in Azure"
  default     = "otomi-aks-quickstart"
}

