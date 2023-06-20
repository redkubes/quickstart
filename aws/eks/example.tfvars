# Required variables
# - Fill in before beginning quickstart
# - Check variables.tf for variable type(includes defaults)
# ==========================================================

# AWS Accounts - this will be used later to decide who can access the cluster
aws_accounts = ["<your_aws_account_number>"]

aws_profile = "default"

# Optional variables, uncomment to customize the quickstart
# ----------------------------------------------------------

# AWS IAM Roles - this will be used later to decide who can access the cluster
aws_roles = [
  {
    rolearn  = "arn:aws:iam::<your_aws_account_number>:role/OrganizationAccountAccessRole"
    username = "OrganizationAccountAccessRole"
    groups   = ["system:masters"]
  },
]

# AWS IAM Users - this will be used later to decide who can access the cluster
aws_users = [
    {
      userarn  = "arn:aws:iam::<your_aws_account_number>:user/admin"
      username = "admin"
      groups   = ["system:masters"]

    },
]

# EKS Cluster Name (default: otomi-eks-quickstart)
cluster_name = "otomi"

# AWS region for all resources(default: eu-central-1)
aws_region = "eu-central-1"

# Kubernetes version used for creating workload cluster(default: 1.21)
cluster_version = "1.24"

instance_types = ["c5.xlarge"]

capacity_type = "SPOT" # "Oneof ON_DEMAND or SPOT "

desired_capacity = 3
maximum_capacity = 5
minimum_capacity = 1

ami_type = "AL2_x86_64"
disk_size = 100


