variable "gke_username" {
  default     = ""
  description = "gke username"
}

variable "gke_password" {
  default     = ""
  description = "gke password"
}

variable "gke_num_nodes" {
  default     = 3
  description = "number of gke nodes"
}

variable "project_id" {
  description = "The project ID to host the cluster in"
}
variable "cluster_name" {
  description = "The name for the GKE cluster"
  default     = "gke-quickstart"
}
variable "env_name" {
  description = "The environment for the GKE cluster"
  default     = "poc"
}
variable "region" {
  description = "The region to host the cluster in"
  default     = "europe-west4"
}