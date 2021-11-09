# GKE cluster

# By default we are creating a `regional cluster`
# A regional cluster in the europe-west4 region creates replicas of the control plane and nodes in three europe-west4 zones: europe-west4-a, europe-west4-b, and europe-west4-c
# Fore more details: https://cloud.google.com/kubernetes-engine/docs/concepts/regional-clusters
resource "google_container_cluster" "primary" {
  name     = var.cluster_name
  location = var.region

  # We can't create a cluster with no node pool defined, but we want to only use
  # separately managed node pools. So we create the smallest possible default
  # node pool and immediately delete it.
  remove_default_node_pool = true
  initial_node_count       = 1

  network    = google_compute_network.vpc.name
  subnetwork = google_compute_subnetwork.subnet.name
}

# Separately Managed Node Pool
resource "google_container_node_pool" "primary_nodes" {
  name       = "${google_container_cluster.primary.name}-node-pool"
  location   = var.region
  cluster    = google_container_cluster.primary.name
  node_count = var.gke_num_nodes_per_zone

  node_config {
    oauth_scopes = [
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
      "https://www.googleapis.com/auth/ndev.clouddns.readwrite"
    ]

    labels = {
      env = var.env_name
    }

    # preemptible  = true
    machine_type = "e2-highmem-4"
    tags         = ["gke-node", "${var.project_id}-gke"]
    metadata = {
      disable-legacy-endpoints = "true"
    }
  }
}
