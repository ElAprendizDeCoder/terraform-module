variable "resourceGroupName" {
    type = string
    description = "This is used to identify resourceGroupName"
}


variable "virtualNetworkName" {
    type = string
    description = "This is used to identify virtualNetworkName"
}


variable "virtualNetworkLocation" {
    type = string 
    description = "This is used to identify virtualNetworkLocation"

}

variable "virtualNetworkAddressSpace" {
    type = list(string)
    description = "This is used to network addressSpace"

}



variable "virtualNetworkTags" {
    type = map(string)
}

