terraform {
  backend "azurerm" {}
}

provider "azurerm" {
  features {}
  version         = ">= 3.0.0"
  skip_provider_registration = true
}

resource "azurerm_resource_group" "aks" {
  name     = "ForzaResourceGroup-java"
  location = "East US"
}

resource "azurerm_kubernetes_cluster" "aks" {
  name                = "ForzaAKSCluster-java"
  location            = azurerm_resource_group.aks.location
  resource_group_name = azurerm_resource_group.aks.name
  dns_prefix          = "forzaaks"

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_DS2_v2"
  }

  identity {
    type = "SystemAssigned"
  }
}