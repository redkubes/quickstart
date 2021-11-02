data "google_client_config" "default" {}

# data "gke" "cluster" {
#   name = module.gke.name
# }

provider "helm" {
  kubernetes {
  # host                   = "https://${module.gke.endpoint}"
  host                   = ""
  token                  = data.google_client_config.default.access_token
  cluster_ca_certificate = base64decode(module.gke.ca_certificate)
  }
}

resource "helm_release" "otomi" {
  name = "quickstart-otomi"

  repository = "https://otomi.io/otomi-core"
  chart      = "otomi"

  values = [
    file("${path.module}/otomi-values-gke.yaml")
  ]
}
