data "azurerm_resource_group" "resourceGroup" {
  name = var.resourceGroupName
}

data "azurerm_virtual_network" "virtualNetwork" {
  name                = var.virtualNetworkName
  resource_group_name = data.azurerm_resource_group.resourceGroup.name
}


resource "azurerm_subnet" "subnet" {
  count                = length(var.subnetAddressPrefix)
  name                 = "${var.subnetName}${count.index + 1}"
  resource_group_name  = data.azurerm_resource_group.resourceGroup.name
  virtual_network_name = data.azurerm_virtual_network.virtualNetwork.name
  address_prefixes     = [var.subnetAddressPrefix[count.index]]
    
}



