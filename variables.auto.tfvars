#resource group variables
resource_group_name_primary   = "primaryRG"
location_primary              = "eastus"
resource_group_name_secondary = "secondaryRG"
location_secondary            = "centralus"
resource_group_name_tm        = "trafficmanagerRG"
location_tm                   = "eastus"

#virtual networks variables
network_name_primary = "vnetprimary"
#add address space
network_name_secondary = "vnetsecondary"
#add address space
network_name_tm = "vnettrafficmanager"
#add address space

#primary vnet subnets
managementsubnet1 = "managementsubnet1"
#add variable subnet space
websubnet1 = "websubnet1"
#add variable subnet space
businesssubnet1 = "businesssubnet1"
#add variable subnet space
datasubnet1 = "databasesubnet1"
#add variable subnet space
ADsubnet1 = "activedirectorysubent1"
#add variable subnet space

#secondary vnet subnets
managementsubnet2 = "managementsubnet2"
#add variable subnet space
websubnet2 = "websubnet2"
#add variable subnet space
businesssubnet2 = "businesssubnet2"
#add variable subnet space
datasubnet2 = "databasesubnet2"
#add variable subnet space
ADsubnet2 = "activedirectorysubent2"
#add variable subnet space

#traffic manager vnet subnet
trafficmanagersubnet = "trafficmanagersubnet"
#add variable subnet space

#virtual network peering
primarytosecondary = "primarytpsecondary"
secondarytoprimary = "secondarytoprimary"






#PIP
linux1_pip_allocation_method = "Dynamic"

#linux1_VM
linux1_publisher                = "Canonical"
linux1_offer                    = "UbuntuServer"
linux1_sku                      = "18.04-LTS"
linux1_version                  = "latest"
linux1_storage_os_disk_caching  = "ReadWrite"
linux1_create_option            = "FromImage"
linux1_managed_disk_type        = "Standard_LRS"
linux1_os_profile_computer_name = "hostname"

#Security Variables
security_rule_name                       = "allow-22"
security_rule_priority                   = 100
security_rule_direction                  = "Inbound"
security_rule_access                     = "Allow"
security_rule_protocol                   = "Tcp"
security_rule_source_port_range          = "*"
security_rule_destination_port_range     = "*"
security_rule_source_address_prefix      = "*"
security_rule_destination_address_prefix = "*"

#Vault Variables
secrets_rg_name   = "secrets"
secret_vault_name = "bjgsecrets"
