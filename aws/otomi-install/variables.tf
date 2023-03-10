variable "aws_region" {
  type        = string
  description = "AWS region used for all resources"
  default     = "eu-central-1"
}
variable "cluster_name" {
  type        = string
  description = "Name of the EKS cluster"
  default     = "otomi-eks-quickstart"
}

variable "cluster_version" {
  type        = string
  description = "AWS EKS cluster version"
  default     = "1.23"
}