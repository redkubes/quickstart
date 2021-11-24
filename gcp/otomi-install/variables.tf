variable "project_id" {
  description = "The gcloud project ID"
  type        = string
}
variable "gke_cluster_name" {
  description = "The name for the GKE cluster"
  type        = string
  default     = "otomi-quickstart"
}

variable "region" {
  description = "The region to host the cluster in"
  type        = string
  default     = "europe-west4"
}