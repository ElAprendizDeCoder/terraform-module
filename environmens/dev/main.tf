module "resourceGroup" {
    source 	= "../../resources/resourcegroup"
    resourceGroupName       = var.resourceGroupName
    resourceGroupLocation   = var.resourceGroupLocation
    resourceGroupTags   = var.resourceGroupTags
}


#VirtualNetwork module
module "virtaulNetwork" {
    source 	= "../../resources/vnet"
    virtualNetworkAddressSpace = var.virtualNetworkAddressSpace
    virtualNetworkName       = var.virtualNetworkName
    virtualNetworkLocation   = var.resourceGroupLocation
    virtualNetworkTags   = var.resourceGroupTags
    resourceGroupName = var.resourceGroupName
    
    depends_on = [module.resourceGroup]

}


# subnets module 
module "subnets" {
    source 	= "../../resources/subnets"
    subnetName              = var.subnetName
    virtualNetworkName      = var.virtualNetworkName
    resourceGroupName       = var.resourceGroupName
    subnetAddressPrefix     = var.subnetAddressPrefix
    
    depends_on = [module.virtaulNetwork]
}


# subnets module 
module "virtualmachine" {
    source 	= "../../resources/virtualMachine"
    subnetName              = var.subnetName
    virtualNetworkName      = var.virtualNetworkName
    resourceGroupName       = var.resourceGroupName
    prefix                  = var.prefix
    prefixVmHostName        = var.prefixVmHostName
    prefixVmUserName        = var.prefixVmUserName
    prefixVmPassword        = var.prefixVmPassword
    
    depends_on = [module.virtaulNetwork]
}


