
locals {
  name            = "eks-otomi-quickstart"
  cluster_version = "1.20"
}

# variable "aws_access_key" {
#   type        = string
#   description = "AWS access key used to create infrastructure"
# }

# variable "aws_secret_key" {
#   type        = string
#   description = "AWS secret key used to create AWS infrastructure"
# }

# variable "aws_session_token" {
#   type        = string
#   description = "AWS session token used to create AWS infrastructure"
#   default     = ""
# }

variable "aws_region" {
  type        = string
  description = "AWS region used for all resources"
  default     = "eu-central-1"
}

variable "cluster_version" {
  type        = string
  description = "AWS EKS cluster version"
  default     = "1.20"
}

variable "aws_accounts" {
  description = "Additional AWS account numbers to add to the aws-auth configmap."
  type        = list(string)

  default = [
    "222222222222",
  ]
}

variable "aws_roles" {
  description = "Additional IAM roles to add to the aws-auth configmap."
  type = list(object({
    rolearn  = string
    username = string
    groups   = list(string)
  }))
  default = [
    {
      rolearn  = "arn:aws:iam::222222222222:admin/user1"
      username = "user1"
      groups   = ["admin"]
    },
  ]
}

variable "aws_users" {
  description = "Additional IAM users to add to the aws-auth configmap."
  type = list(object({
    userarn  = string
    username = string
    groups   = list(string)
  }))

  default = [
    {
      userarn  = "arn:aws:iam::222222222222:admin/user1"
      username = "user1"
      groups   = ["admin"]
    },
  ]
}

variable "eks_cluster_name" {
  default = "otomi-quickstart-eks"
}

variable "environment" {
  default = "community"
}
