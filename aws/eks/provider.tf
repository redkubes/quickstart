provider "aws" {
#   access_key = var.aws_access_key
#   secret_key = var.aws_secret_key
#   token      = var.aws_session_token
  region     = var.aws_region
}

provider "kubernetes" {
  host                   = data.aws_eks_cluster.cluster.endpoint
  cluster_ca_certificate = base64decode(data.aws_eks_cluster.cluster.certificate_authority[0].data)
  token                  = data.aws_eks_cluster_auth.cluster.token
  config_path    = "~/.kube/config"
  # config_context = local.name
}