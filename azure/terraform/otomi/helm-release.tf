provider "helm" {
  kubernetes {
    host                   = data.azurerm_kubernetes_cluster.cluster.kube_config.0.host
    client_certificate     = base64decode(data.azurerm_kubernetes_cluster.cluster.kube_config.0.client_certificate)
    client_key             = base64decode(data.azurerm_kubernetes_cluster.cluster.kube_config.0.client_key)
    cluster_ca_certificate = base64decode(data.azurerm_kubernetes_cluster.cluster.kube_config.0.cluster_ca_certificate)

    exec {
      api_version = "client.authentication.k8s.io/v1beta1"
      args        = ["az", "aks", "get-credentials", "-g", "my-resource-group", "-n", "my-aks-cluster"]
      command     = "az"
    }
  }
}

resource "helm_release" "otomi" {
  name = "quickstart-otomi"

  repository = "https://otomi.io/otomi-core"
  chart      = "otomi"

  values = [
    file("${path.module}/otomi-values-aks.yaml")
  ]
}
