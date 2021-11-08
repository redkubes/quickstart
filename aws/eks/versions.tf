terraform {
  required_version = ">= 0.14"

  required_providers {
    aws        = ">= 3.25.0"
    local      = ">= 1.4"
    kubernetes = "~> 2.0.1"
    helm       = "~> 2.0"
    random     = ">= 2.1"
  }
}
