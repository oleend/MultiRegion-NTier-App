#Main Terraform File

#RESOURCE GROUPS

resource "azurerm_resource_group" "primary" {
  name     = var.resource_group_name_primary
  location = var.location_primary
}

resource "azurerm_resource_group" "secondary" {
  name     = var.resource_group_name_secondary
  location = var.location_secondary
}

resource "azurerm_resource_group" "trafficmanager" {
  name     = var.resource_group_name_tm
  location = var.location_tm
}

#VIRTUAL NETWORKS

resource "azurerm_virtual_network" "primarynet" {
  name                = var.network_name_primary
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.primary.location
  resource_group_name = azurerm_resource_group.primary.name
}

resource "azurerm_virtual_network" "secondarynet" {
  name                = var.network_name_secondary
  address_space       = ["10.1.0.0/16"]
  location            = azurerm_resource_group.secondary.location
  resource_group_name = azurerm_resource_group.secondary.name
}

resource "azurerm_virtual_network" "trafficmanager" {
  name                = var.network_name_tm
  address_space       = ["10.2.0.0/16"]
  location            = azurerm_resource_group.trafficmanager.location
  resource_group_name = azurerm_resource_group.trafficmanager.name
}

#VNETS
#PRIMARY VNETS


#primary vnet subnet- Management
resource "azurerm_subnet" "managementsubnet1" {
  name                 = var.managementsubnet1
  resource_group_name  = azurerm_resource_group.primary.name
 virtual_network_name = azurerm_virtual_network.primarynet.name
  address_prefixes     = ["10.0.1.0/24"]
}

#primary vnet subnet- web
resource "azurerm_subnet" "websubnet1" {
  name                 = var.websubnet1
  resource_group_name  = azurerm_resource_group.primary.name
  virtual_network_name = azurerm_virtual_network.primarynet.name
  address_prefixes     = ["10.0.2.0/24"]
}

#primary vnet subnet- business
resource "azurerm_subnet" "businesssubnet1" {
  name                 = var.businesssubnet1
  resource_group_name  = azurerm_resource_group.primary.name
  virtual_network_name = azurerm_virtual_network.primarynet.name
  address_prefixes     = ["10.0.3.0/24"]
}

#primary vnet subnet- data
resource "azurerm_subnet" "datasubnet1" {
  name                 = var.datasubnet1
  resource_group_name  = azurerm_resource_group.primary.name
  virtual_network_name = azurerm_virtual_network.primarynet.name
  address_prefixes     = ["10.0.4.0/24"]
}

#primary vnet subnet- AD
resource "azurerm_subnet" "ADsubnet1" {
  name                 = var.ADsubnet1
  resource_group_name  = azurerm_resource_group.primary.name
  virtual_network_name = azurerm_virtual_network.primarynet.name
  address_prefixes     = ["10.0.5.0/24"]
}

#primary vnet subnet- Bastion
resource "azurerm_subnet" "AzureBastionSubnet" {
  name                 = var.AzureBastionSubnet
  resource_group_name  = azurerm_resource_group.primary.name
  virtual_network_name = azurerm_virtual_network.primarynet.name
  address_prefixes     = ["10.0.6.0/24"]
}

#SECONDARY VNETS


#secondary vnet subnet- management
resource "azurerm_subnet" "managementsubnet2" {
  name                 = var.managementsubnet2
  resource_group_name  = azurerm_resource_group.secondary.name
  virtual_network_name = azurerm_virtual_network.secondarynet.name
  address_prefixes     = ["10.1.1.0/24"]
}

#secondary vnet subnet- web
resource "azurerm_subnet" "websubnet2" {
  name                 = var.websubnet2
  resource_group_name  = azurerm_resource_group.secondary.name
  virtual_network_name = azurerm_virtual_network.secondarynet.name
  address_prefixes     = ["10.1.2.0/24"]
}

#secondary vnet subnet- business
resource "azurerm_subnet" "businesssubnet2" {
  name                 = var.businesssubnet2
  resource_group_name  = azurerm_resource_group.secondary.name
  virtual_network_name = azurerm_virtual_network.secondarynet.name
  address_prefixes     = ["10.1.3.0/24"]
}

#secondary vnet subnet- data
resource "azurerm_subnet" "datasubnet2" {
  name                 = var.datasubnet2
  resource_group_name  = azurerm_resource_group.secondary.name
  virtual_network_name = azurerm_virtual_network.secondarynet.name
  address_prefixes     = ["10.1.4.0/24"]
}

#secondary vnet subnet- AD
resource "azurerm_subnet" "ADsubnet2" {
  name                 = var.ADsubnet2
  resource_group_name  = azurerm_resource_group.secondary.name
  virtual_network_name = azurerm_virtual_network.secondarynet.name
  address_prefixes     = ["10.1.5.0/24"]
}

#Secondary vnet subnet- Bastion
resource "azurerm_subnet" "AzureBastionSubnet2" {
  name                 = var.AzureBastionSubnet
  resource_group_name  = azurerm_resource_group.secondary.name
  virtual_network_name = azurerm_virtual_network.secondarynet.name
  address_prefixes     = ["10.1.6.0/24"]
}


#OTHER VNET


#Traffic Manager Subnet
resource "azurerm_subnet" "trafficmanagersubnet" {
  name                 = var.trafficmanagersubnet
  resource_group_name  = azurerm_resource_group.trafficmanager.name
  virtual_network_name = azurerm_virtual_network.trafficmanager.name
  address_prefixes     = ["10.2.1.0/24"]
}


#PEERING


#Vnet Peering- Primary to Secondary
resource "azurerm_virtual_network_peering" "primarytosecondary" {
  name                      = var.primarytosecondary
  resource_group_name       = azurerm_resource_group.primary.name
  virtual_network_name      = azurerm_virtual_network.primarynet.name
  remote_virtual_network_id = azurerm_virtual_network.secondarynet.id
}

#Vnet Peering- Secondary to Primary
resource "azurerm_virtual_network_peering" "secondarytoprimary" {
  name                      = var.secondarytoprimary
  resource_group_name       = azurerm_resource_group.secondary.name
  virtual_network_name      = azurerm_virtual_network.secondarynet.name
  remote_virtual_network_id = azurerm_virtual_network.primarynet.id
}


#BASTION HOSTS


#Bastion 1- VNET 1

#Creating the Public IP: Bastion Host 1
resource "azurerm_public_ip" "bastion_pip" {
  name                = "bastion_pip"
  location            = azurerm_resource_group.primary.location
  resource_group_name = azurerm_subnet.AzureBastionSubnet.resource_group_name
  allocation_method   =  "Static"
  sku                 =  "Standard"
}

#Creating the resource: Bastion Host 1
resource "azurerm_bastion_host" "firstBastion" {
  name                = var.bastion_name
  location            = azurerm_resource_group.primary.location
  resource_group_name = azurerm_subnet.AzureBastionSubnet.resource_group_name

  ip_configuration {
    name                 = "Bastionpip1"
    subnet_id            = azurerm_subnet.AzureBastionSubnet.id
    public_ip_address_id = azurerm_public_ip.bastion_pip.id
  }
}

#Bastion 2- VNET 2

#Creating the Public IP: Bastion Host 2
resource "azurerm_public_ip" "bastion_pip2" {
  name                = "bastion_pip2"
  location            = azurerm_resource_group.secondary.location
  resource_group_name = "secondaryRG"
  allocation_method   =  "Static"
  sku                 =  "Standard"
}

#Creating the resource: Bastion Host 2
resource "azurerm_bastion_host" "secondBastion" {
  name                = var.bastion_name2
  location            = azurerm_resource_group.secondary.location
  resource_group_name = "secondaryRG"

  ip_configuration {
    name                 = "Bastionpip1"
    subnet_id            = azurerm_subnet.AzureBastionSubnet2.id
    public_ip_address_id = azurerm_public_ip.bastion_pip2.id
  }
}



#LB Created for Buisness Hosts
resource "azurerm_lb" "vnet1loadbalancer" {
name = var.vnet1loadbalancer
location = azurerm_resource_group.primary.location
resource_group_name = azurerm_resource_group.primary.name



frontend_ip_configuration {
name = "PrivateIPAddress"
subnet_id = azurerm_subnet.datasubnet1.id
private_ip_address = "10.0.4.5"
private_ip_address_allocation = "static"
}
}



resource "azurerm_lb_backend_address_pool" "bpepool" {

loadbalancer_id = azurerm_lb.vnet1loadbalancer.id
name = "BackEndAddressPool"
}




#BUISNESS TIER VMS

resource "azurerm_lb_probe" "buisnesshealth" {
  resource_group_name = azurerm_resource_group.primary.location
  loadbalancer_id     = azurerm_lb.vnet1loadbalancer.id
  name                = "http-probe-buisness1"
  protocol            = "Http"
  request_path        = "/health"
  port                = 8080
}


#Scale Set- Buisness Teir
resource "azurerm_virtual_machine_scale_set" "buisnesstier1" {
  name                = "buisnesstier1"
  location            = azurerm_resource_group.primary.location
  resource_group_name = "primaryRG"

  # automatic rolling upgrade
  automatic_os_upgrade = true
  upgrade_policy_mode  = "Rolling"

  rolling_upgrade_policy {
    max_batch_instance_percent              = 20
    max_unhealthy_instance_percent          = 20
    max_unhealthy_upgraded_instance_percent = 5
    pause_time_between_batches              = "PT0S"
  }

  # required when using rolling upgrade policy
  health_probe_id = azurerm_lb_probe.buisnesshealth.id

  sku {
    name     = "Standard_B1s"
    tier     = "Basic"
    capacity = 3
  }

  storage_profile_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "16.04-LTS"
    version   = "latest"
  }

  storage_profile_os_disk {
    name              = "buisnessosdisk"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }

    os_profile {
    computer_name_prefix = "buisness1"
    admin_username       = "myadmin"
    admin_password = "Password1234!"
  }

  os_profile_linux_config {
    disable_password_authentication = false

   
  }
}
















#TEST VM IF NEEDED

#test VM NIC
#resource "azurerm_network_interface" "testvmnic" {
#  name                = "testvmnic"
#  location            = azurerm_resource_group.primary.location
#  resource_group_name = "primaryRG"

#  ip_configuration {
#    name                          = "testvmip"
#    subnet_id                     = azurerm_subnet.businesssubnet1.id
#    private_ip_address_allocation = "Dynamic"
#  }
#}

#Test VM- VM
#resource "azurerm_virtual_machine" "testvm" {
#  name                  = "test-vm"
#  location              = azurerm_resource_group.primary.location
#  resource_group_name   = "primaryRG"
#  network_interface_ids = [azurerm_network_interface.testvmnic.id]
#  vm_size               = "Standard_B1s"

#   storage_image_reference {
#  publisher = "Canonical"
#    offer     = "UbuntuServer"
#    sku       = "16.04-LTS"
#    version   = "latest"
#  }
#  os_profile_linux_config {
#    disable_password_authentication = false
#  }
#  storage_os_disk {
#    name              = "vmosdisk1"
#  caching           = "ReadWrite"
#   create_option     = "FromImage"
#   }
# os_profile {
#   computer_name  = "hostname"
#   admin_username = "testadmin"
#   admin_password = "Password1234!"
# }


#}