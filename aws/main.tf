################################################################################
# EKS Module
################################################################################

module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  cluster_name    = local.name
  cluster_version = var.cluster_version

  vpc_id  = module.vpc.vpc_id
  subnets = module.vpc.private_subnets

  cluster_endpoint_private_access = true
  cluster_endpoint_public_access  = true

  node_groups_defaults = {
    ami_type  = "AL2_x86_64"
    disk_size = 100
  }

  node_groups = {
    default = {
      desired_capacity = 5
      max_capacity     = 5
      min_capacity     = 1

      instance_types = ["c5.xlarge"]
      capacity_type  = "ON_DEMAND"
      k8s_labels = {
        role       = "worker"
      }
      additional_tags = {
        nodegroup-role                            = "worker"
        "k8s.io/cluster-autoscaler/enabled"       = "true"
        "k8s.io/cluster-autoscaler/${local.name}" = "owned"
      }
      update_config = {
        max_unavailable_percentage = 50
      }
    }
  }

  map_roles    = var.aws_roles
  map_users    = var.aws_users
  map_accounts = var.aws_accounts

  tags = {
    community                                 = local.name
    "k8s.io/cluster-autoscaler/enabled"       = "true"
    "k8s.io/cluster-autoscaler/${local.name}" = "owned"
  }
}

################################################################################
# Kubernetes provider configuration
################################################################################

data "aws_eks_cluster" "cluster" {
  name = module.eks.cluster_id
}

data "aws_eks_cluster_auth" "cluster" {
  name = module.eks.cluster_id
}


################################################################################
# Supporting Resources
################################################################################

data "aws_availability_zones" "available" {
  # names = ["eu-central-1a", "eu-central-1b", "eu-central-1c"]
}

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "~> 3.0"

  name                 = local.name
  cidr                 = "10.0.0.0/16"
  azs                  = data.aws_availability_zones.available.names
  private_subnets      = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  public_subnets       = ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]
  enable_nat_gateway   = true
  single_nat_gateway   = true
  enable_dns_hostnames = true

  public_subnet_tags = {
    "kubernetes.io/cluster/${local.name}" = "shared"
    "kubernetes.io/role/elb"              = "1"
  }

  private_subnet_tags = {
    "kubernetes.io/cluster/${local.name}" = "shared"
    "kubernetes.io/role/internal-elb"     = "1"
  }

  tags = {
    community       = local.name
  }
}
