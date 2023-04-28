variable "aws_profile" {
  description = "Set this variable if you use another profile besides the default awscli profile called 'default'."
  type        = string
  default     = "default"
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
    rolearn  = "arn:aws:iam::222222222222:role/OrganizationAccountAccessRole"
    username = "OrganizationAccountAccessRole"
    groups   = ["system:masters"]
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
      userarn  = "arn:aws:iam::222222222222:user/admin"
      username = "admin"
      groups   = ["system:masters"]
    },
  ]
}

variable "aws_region" {
  type        = string
  description = "AWS region used for all resources"
  default     = "eu-central-1"
}

variable "aws_availability_zones" {
  description = "AWS availability zones"
  default     = ["eu-central-1a", "eu-central-1b", "eu-central-1c"]
}
variable "cluster_name" {
  type        = string
  description = "Name of the EKS cluster"
  default     = "otomi"
}

variable "cluster_version" {
  type        = string
  description = "AWS EKS cluster version"
  default     = "1.23"
}

variable "environment" {
  default = "community"
}

variable "chart_version_aws_ebs_csi_driver" {
  type        = string
  description = "Chart version"
  default     = null
}

