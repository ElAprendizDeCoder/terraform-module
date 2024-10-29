resourceGroupName = "testlabdrangelsc01"
resourceGroupLocation = "South Central US"
resourceGroupTags = {
        "author"   = "david_rangel"
        "provider" = "drangel"
        "project"  = "testlab"
        "env"      = "dev"
}
#Virtual Network
virtualNetworkAddressSpace = ["10.0.0.0/18"]
virtualNetworkName = "vnettestlabsc01"
# Subnets
subnetName = "snettestlabsc01"
subnetAddressPrefix = ["10.0.1.0/24"]
#Virtual Machine

prefix = "testlabvm"
prefixVmHostName = "testlabvm"
prefixVmUserName = "admintestlab"

