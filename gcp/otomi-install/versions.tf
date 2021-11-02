terraform {
  required_providers {
    helm = {
      source  = "hashicorp/helm"
      version = "~> 2.0.1"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.0.1"
    }
    google = {
      source  = "hashicorp/google"
      version = ">=3.42.0"
    }
  }
  required_version = ">= 0.14"

}
