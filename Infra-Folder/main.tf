terraform {
  backend "azurerm" {}
}

provider "azurerm" {
  features {}
  version         = ">= 3.0.0"
  skip_provider_registration = true
}


resource "azurerm_kubernetes_cluster" "aks" {
  name                = "ForzaCapstoneAKSCluster-java"
  location            = "East US"
  resource_group_name = "ForzaCapstoneResourceGroup"
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