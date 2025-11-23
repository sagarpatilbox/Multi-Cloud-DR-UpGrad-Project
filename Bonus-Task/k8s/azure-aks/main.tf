provider "azurerm" {
  features {}
  subscription_id = "4c419c18-22ee-4dfa-8014-71f05d545136"
}

resource "azurerm_resource_group" "rg" {
  name     = "aks-dr-rg"
  location = "West US3"
}

resource "azurerm_kubernetes_cluster" "aks" {
  name                = "aks-dr-cluster"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  dns_prefix          = "aksdr"

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_B2s"
  }

  identity {
    type = "SystemAssigned"
  }
}