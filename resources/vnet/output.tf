output "completevirtualNetwork" {
    value = azurerm_virtual_network.virtualNetwork
}


output "virtualNetworkIdentifier" {
    value = azurerm_virtual_network.virtualNetwork.id
}



output "virtualNetworkName" {
    value = azurerm_virtual_network.virtualNetwork.name
}



output "virtualNetworkTags" {
    value = azurerm_virtual_network.virtualNetwork.tags
}


output "virtualNetworkLocation" {
    value = azurerm_virtual_network.virtualNetwork.location
}

