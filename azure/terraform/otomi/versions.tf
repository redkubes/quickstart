terraform {
  required_version = ">= 0.14"

  required_providers {
    azurerm    = ">=2.84.0"
    kubernetes = "~> 2.0.1"
    helm       = "~> 2.0"
  }
}