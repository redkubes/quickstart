variable "cluster_name" {
  type        = string
  description = "AKS name in Azure"
  default     = "otomi-aks-quickstart"
}

variable "resource_group_name" {
  type        = string
  description = "RG name in Azure"
  default     = "otomi"
}

###Vars for login
variable "subscription_id" {
  description = "Your subscription id you can find in Azure console"
  type        = string
  default     = "2a9b14b9-ea97-4f7b-b9fb-31ef281489b9"
}

variable "client_id" {
  description = "Your client id you can find in Azure console"
  type        = string
  default     = "d8f0e642-46bb-4d2f-a681-09314bbea0e6"
}

variable "client_secret" {
  description = "Your client secret you can find in Azure console"
  type        = string
  default     = "vOc8Q~6eQWKSp4TLeOIDYL4DTIc4iylisP71QaKk"
}

variable "tenant_id" {
  description = "Your tenant id you can find in Azure console"
  type        = string
  default     = "f709e22e-043b-46fb-bcbe-1ed271787922"
}