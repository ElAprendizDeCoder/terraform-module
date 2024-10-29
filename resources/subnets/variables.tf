variable "resourceGroupName" {
    type = string
    description = "This is used to identify resourceGroupName"
}


variable "virtualNetworkName" {
    type = string
    description = "This is used to identify virtualNetworkName"
}


variable "subnetName" {
    type= string
    description = "This is used to subnet name"
}


variable "subnetAddressPrefix" {
    type = list(string)
    description = "This is used to network addressSpace"

}


