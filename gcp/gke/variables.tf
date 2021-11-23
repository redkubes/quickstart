variable "project_id" {
  description = "The project ID to host the cluster in"
}
variable "cluster_name" {
  description = "The name for the GKE cluster"
  default     = "otomi-quickstart"
  validation {
    condition     = can(regex("^(?:[a-z](?:[-a-z0-9]{0,61}[a-z0-9])?)$", var.cluster_name))
    error_message = "The cluster_name value must be lowercase and cannot start or end with non-alphanumeric character."
  }
}
variable "env_name" {
  description = "The environment for the GKE cluster"
  default     = "quickstart"
}


variable "region" {
  description = "The region to host the cluster in"
  default     = "europe-west4"
}

# By default we are creating a `regional cluster`
# A regional cluster in the europe-west4 region creates replicas of the control plane and nodes in three europe-west4 zones: europe-west4-a, europe-west4-b, and europe-west4-c
# Example: Adding `gke_num_nodes_per_zone`: 3 will create 9 nodes (three across each zone)
# Tip: stick to default for evaluation purpose
variable "gke_num_nodes_per_zone" {
  default     = 1
  description = "number of gke nodes per zone"
}
