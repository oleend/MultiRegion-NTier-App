#Resource Group Varables and location need to be defined
resource "azurerm_resource_group" "main" {
  name     = var.resource_group_name
  location = var.location
}


#Vnets
resource "azurerm_virtual_network" "Network" {
  name                = var.network_name
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
}

#vnet2
resource "azurerm_virtual_network" "Network2" {
  name                = var.network_name_2
  address_space       = ["10.1.0.0/16"]
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
}


#First subnet- Subnets should be good
resource "azurerm_subnet" "Managementsub1" {
  name                 = "Managementsub1"
  resource_group_name  = azurerm_resource_group.main.name
  virtual_network_name = azurerm_virtual_network.Network.name
  address_prefixes     = ["10.0.1.0/24"]
#vnet1 - sub2
resource "azurerm_subnet" "websubnet1" {
  name                 = "websubnet1"
  resource_group_name  = azurerm_resource_group.main.name
  virtual_network_name = azurerm_virtual_network.Network.name
  address_prefixes     = ["10.0.2.0/24"]
#Vnet1- sub3
resource "azurerm_subnet" "buisnessSubnet1" {
  name                 = "buisnessSubnet1"
  resource_group_name  = azurerm_resource_group.main.name
  virtual_network_name = azurerm_virtual_network.Network.name
  address_prefixes     = ["10.0.3.0/24"]
#Vnet1- sub4
  resource "azurerm_subnet" "datasubnet1" {
  name                 = "datasubnet1"
  resource_group_name  = azurerm_resource_group.main.name
  virtual_network_name = azurerm_virtual_network.Network.name
  address_prefixes     = ["10.0.4.0/24"]
 #Vnet1- sub5
  resource "azurerm_subnet" "ADSubnet1" {
  name                 = "ADSubnet1"
  resource_group_name  = azurerm_resource_group.main.name
  virtual_network_name = azurerm_virtual_network.Network.name
  address_prefixes     = ["10.0.5.0/24"]



#Second Vnet- sub1
resource "azurerm_subnet" "Managementsub2" {
  name                 = "Managementsub2"
  resource_group_name  = azurerm_resource_group.main.name
  virtual_network_name = azurerm_virtual_network.Network2.name
  address_prefixes     = ["10.1.1.0/24"]
#vnet1 - sub2
  resource "azurerm_subnet" "websubnet2" {
  name                 = "websubnet2"
  resource_group_name  = azurerm_resource_group.main.name
  virtual_network_name = azurerm_virtual_network.Network2.name
  address_prefixes     = ["10.1.2.0/24"]
#vnet1 - sub3
  resource "azurerm_subnet" "buisnessSubnet1" {
  name                 = "buisnessSubnet1"
  resource_group_name  = azurerm_resource_group.main.name
  virtual_network_name = azurerm_virtual_network.Network2.name
  address_prefixes     = ["10.1.3.0/24"]
#vnet1 - sub4
  resource "azurerm_subnet" "datasubnet1" {
  name                 = "datasubnet1"
  resource_group_name  = azurerm_resource_group.main.name
  virtual_network_name = azurerm_virtual_network.Network2.name
  address_prefixes     = ["10.1.4.0/24"]
#vnet1 - sub5
  resource "azurerm_subnet" "ADSubnet1" {
  name                 = "ADSubnet1"
  resource_group_name  = azurerm_resource_group.main.name
  virtual_network_name = azurerm_virtual_network.Network2.name
  address_prefixes     = ["10.1.5.0/24"]


  #Working on Virst Vnet Managment With bastion, needs work


  #public ip
  resource "azurerm_public_ip" "bastion_ip1" {
  name                = "bastion_ip1"
  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location
  allocation_method   = "Static"
}
#Network interface
resource "azurerm_network_interface" "main_nic_Bastion1" {
  name                = "main_nic_Bastion1"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name

  ip_configuration {
    name                          = "Internal_Bastion1"
    subnet_id                     = azurerm_subnet.Managementsub1.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.bastion_ip1.id
  }
}

#Virtual mashine
resource "azurerm_virtual_machine" "bastion_vm" {
  name                  = "bastion-vm"
  location              = azurerm_resource_group.main.location
  resource_group_name   = azurerm_resource_group.main.name
  network_interface_ids = [azurerm_network_interface.main_nic.id]
  vm_size               = "Standard_B1s"




#OS Disk
  storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "16.04-LTS"
    version   = "latest"
  }
  storage_os_disk {
    name              = "myosdisk1"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
  os_profile {
    computer_name  = "hostname"
    admin_username = "testadmin"
    admin_password = "Password1234!"
  }
  os_profile_linux_config {
    disable_password_authentication = false
  }
  tags = {
    environment = "staging"
  }
}

