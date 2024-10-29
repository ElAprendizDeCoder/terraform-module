output "completeSubnet" {
    value = azurerm_subnet.subnet
}


output "subnetIdentifier" {
    value = azurerm_subnet.subnet[*].id
}



output "subnetName" {
    value = azurerm_subnet.subnet[*].name
}

output "addressPrefixes" {
    value = azurerm_subnet.subnet[*].address_prefixes
}


