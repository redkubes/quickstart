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

variable "cluster_name" {
  type        = string
  description = "Name of the EKS cluster"
  default     = "otomi"
}

variable "cluster_version" {
  type        = string
  description = "AWS EKS cluster version"
  default     = "1.27"
}

variable "environment" {
  default = "community"
}

variable "chart_version_aws_ebs_csi_driver" {
  type        = string
  description = "Chart version"
  default     = null
}

variable "capacity_type" {
  type = string
  description = "ON_DEMAND or SPOT"
  default = "SPOT"
}


variable "instance_types" {
  type = list
  description = "Pool of Instance types , https://aws.amazon.com/ec2/instance-types/"
  default = ["c5.xlarge", "c5a.xlarge", "m5a.xlarge"]
}

variable "desired_capacity" {
  type = number
  description = "Desired number of nodes in the cluster"
  default = 3
}

variable "maximum_capacity" {
  type = number
  description = "Maximum number of allowed nodes in the cluster"
  default = 5
}

variable "minimum_capacity" {
  type = number
  description = "Maximum number of allowed nodes in the cluster"
  default = 1
}

variable "ami_type" {
  type = string
  description = "AL2_x86_64 | AL2_ARM_64 | BOTTLEROCKET_x86_64"
  default = "AL2_x86_64"
}

variable "disk_size" {
  type = number
  description = "EBS Disk size in GB"
  default = 100  
}