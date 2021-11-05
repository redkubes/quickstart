# Configure the Azure provider
provider "azurerm" {
  features {}
  tenant_id       = var.az_tenant_id
  subscription_id = var.az_subscription_id
}

resource "azurerm_resource_group" "community-quickstart" {
  name     = "${var.resource_group_name}-rg"
  location = var.location
}

resource "azurerm_virtual_network" "community-quickstart" {
  name                = "${var.resource_group_name}-network"
  location            = azurerm_resource_group.community-quickstart.location
  resource_group_name = azurerm_resource_group.community-quickstart.name
  address_space       = ["10.1.0.0/16"]
}

resource "azurerm_subnet" "community-quickstart" {
  name                 = "${var.resource_group_name}-subnet"
  virtual_network_name = azurerm_virtual_network.community-quickstart.name
  resource_group_name  = azurerm_resource_group.community-quickstart.name
  address_prefixes     = ["10.1.0.0/22"]

  /* delegation {
    name = "delegation"

    service_delegation {
      name    = "Microsoft.ContainerInstance/containerGroups"
      actions = ["Microsoft.Network/virtualNetworks/subnets/join/action", "Microsoft.Network/virtualNetworks/subnets/prepareNetworkPolicies/action"]
    }
  }*/
}

resource "azurerm_kubernetes_cluster" "community-quickstart" {
  name                = "${var.resource_group_name}-aks"
  location            = azurerm_resource_group.community-quickstart.location
  resource_group_name = azurerm_resource_group.community-quickstart.name
  dns_prefix          = "${var.resource_group_name}-aks"


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
    vnet_subnet_id = azurerm_subnet.community-quickstart.id
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
    Environment = "community"
  }
}
