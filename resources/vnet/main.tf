data "azurerm_resource_group" "resourceGroup" {
  name = var.resourceGroupName
}




resource "azurerm_virtual_network" "virtualNetwork" {
  name                = var.virtualNetworkName
  location            = var.virtualNetworkLocation
  resource_group_name = data.azurerm_resource_group.resourceGroup.name
  address_space       = var.virtualNetworkAddressSpace
  
  tags = data.azurerm_resource_group.resourceGroup.tags
  
}

