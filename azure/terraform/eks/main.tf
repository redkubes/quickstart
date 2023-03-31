resource "azurerm_resource_group" "aks-rg" {
  name     = var.resource_group_name
  location = var.location
}

module "aks" {
  source  = "Azure/aks/azurerm"
  version = "6.7.1"
  
  prefix              = "dev"
  cluster_name        = var.cluster_name
  resource_group_name = azurerm_resource_group.aks-rg.name
  location            = var.location
  agents_pool_name    = "otomipool"
  agents_availability_zones = [1, 2]
  agents_size         = "Standard_F8s_v2"
  orchestrator_version = "1.23.15"
  enable_auto_scaling = true
  agents_min_count = 1
  agents_max_count = 6
  agents_max_pods  = 100
  network_plugin   = "azure"
  network_policy   = "calico"
  rbac_aad         = false

  depends_on = [azurerm_resource_group.aks-rg]
}
