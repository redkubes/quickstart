# Required variables
# - Fill in before beginning otomi-install
# - Check variables.tf for variable type(includes defaults)
# ==========================================================

# Optional variables, uncomment to customize the quickstart
# ----------------------------------------------------------

# EKS Cluster Name (default: otomi-eks-quickstart)
cluster_name = "otomi"

# AWS region for all resources(default: eu-central-1)
aws_region = "eu-central-1"

# Kubernetes version used for creating workload cluster(default: 1.24)
cluster_version = "1.24"
