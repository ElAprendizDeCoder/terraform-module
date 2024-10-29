data "azurerm_resource_group" "resourceGroup" {
  name = var.resourceGroupName
}

data "azurerm_virtual_network" "virtualNetwork" {
  name                = var.virtualNetworkName
  resource_group_name = data.azurerm_resource_group.resourceGroup.name
}

data "azurerm_subnet" "private" {
  name                 = var.subnetName
  virtual_network_name = data.azurerm_virtual_network.virtualNetwork.name
  resource_group_name  = data.azurerm_resource_group.resourceGroup.name
}



resource "azurerm_network_interface" "main" {
  name                = "${var.prefix}-nic"
  location            = data.azurerm_resource_group.resourceGroup.location
  resource_group_name = data.azurerm_resource_group.resourceGroup.name

  ip_configuration {
    name                          = "testconfiguration1"
    subnet_id                     = data.azurerm_subnet.private.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_virtual_machine" "main" {
  name                  = "${var.prefix}-vm"
  location            = data.azurerm_resource_group.resourceGroup.location
  resource_group_name = data.azurerm_resource_group.resourceGroup.name
  network_interface_ids = [azurerm_network_interface.main.id]
  vm_size               = "Standard_DS1_v2"

  # Uncomment this line to delete the OS disk automatically when deleting the VM
  # delete_os_disk_on_termination = true

  # Uncomment this line to delete the data disks automatically when deleting the VM
  # delete_data_disks_on_termination = true

  storage_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
  storage_os_disk {
    name              = "${var.prefix}-vm-disk"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
  os_profile {
    computer_name  = "${var.prefixVmHostName}"
    admin_username = "${var.prefixVmUserName}"
    admin_password = "${var.prefixVmPassword}"
  }
  os_profile_linux_config {
    disable_password_authentication = false
  }
  tags = data.azurerm_resource_group.resourceGroup.tags
}
