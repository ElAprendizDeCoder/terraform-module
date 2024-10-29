variable "resourceGroupName" {
    type = string
    description = "This is used to identify resourceGroupName"
}


variable "virtualNetworkName" {
    type = string
    description = "This is used to identify virtualNetworkName"
}


variable "subnetName" {
    type = string 
    description = "This is used to identify subnetName"

}

variable "prefix" {
    type = string
    description = "prefix virtualMachine"

}



variable "prefixVmHostName" {
    type = string
    description = "prefix VmHostName"

}

variable "prefixVmUserName" {
    type = string
    description = "prefix VmUserName"

}

variable "prefixVmPassword" {
    type = string
    description = "prefix VmUserName"

}