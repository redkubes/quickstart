# Configure the Azure provider
provider "azurerm" {
  features {}
  tenant_id       = var.az_tenant_id
  subscription_id = var.az_subscription_id
}

resource "azurerm_resource_group" "otomi-quickstart" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_virtual_network" "otomi-quickstart" {
  name                = "${var.resource_group_name}-network"
  location            = azurerm_resource_group.otomi-quickstart.location
  resource_group_name = azurerm_resource_group.otomi-quickstart.name
  address_space       = ["10.1.0.0/16"]
}

resource "azurerm_subnet" "otomi-quickstart" {
  name                 = "${var.resource_group_name}-subnet"
  virtual_network_name = azurerm_virtual_network.otomi-quickstart.name
  resource_group_name  = azurerm_resource_group.otomi-quickstart.name
  address_prefixes     = ["10.1.0.0/22"]

}

resource "azurerm_kubernetes_cluster" "otomi-quickstart" {
  name                = var.cluster_name
  location            = azurerm_resource_group.otomi-quickstart.location
  resource_group_name = azurerm_resource_group.otomi-quickstart.name
  dns_prefix          = var.cluster_name


  default_node_pool {
    name                = "agentpool"
    node_count          = 3
    vm_size             = "Standard_D3_v2"
    type                = "VirtualMachineScaleSets"
    availability_zones  = ["1", "2", "3"]
    enable_auto_scaling = true
    min_count           = 3
    max_count           = 5
    max_pods            = 110


    # Required for advanced networking
    vnet_subnet_id = azurerm_subnet.otomi-quickstart.id
  }

  role_based_access_control {
    enabled = true
  }

  identity {
    type = "SystemAssigned"
  }

  network_profile {
    network_plugin    = "azure"
    load_balancer_sku = "standard"
    network_policy    = "calico"
  }

  tags = {
    Environment = "otomi"
  }
}
