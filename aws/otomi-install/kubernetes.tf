provider "aws" {
  region = var.aws_region
}

locals {
  cluster_id      = "eks-otomi-quickstart"
  cluster_version = "1.20"
}


# Retrieve EKS cluster configuration
data "aws_eks_cluster" "cluster" {
  # name = data.terraform_remote_state.eks.outputs.cluster_id
  name = local.cluster_id
}


provider "kubernetes" {
  host                   = data.aws_eks_cluster.cluster.endpoint
  cluster_ca_certificate = base64decode(data.aws_eks_cluster.cluster.certificate_authority.0.data)
  exec {
    api_version = "client.authentication.k8s.io/v1alpha1"
    args        = ["eks", "get-token", "--cluster-name", data.aws_eks_cluster.cluster.name]
    command     = "aws"
  }
}

