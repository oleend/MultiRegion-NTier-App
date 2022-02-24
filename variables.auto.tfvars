#Variables Auto TfVars: Variable information


#RESOURCE GROUPS


#PRIMARY Name and Locaiton
resource_group_name_primary   = "primaryRG"
location_primary              = "eastus2"

#SECONDARY Name and Location
resource_group_name_secondary = "secondaryRG"
location_secondary            = "centralus"

#TrafficManager Name and Location
resource_group_name_tm        = "trafficmanagerRG"
location_tm                   = "eastus"



#VIRTUAL NETWORKS


#PRIMARY Virtual Network
network_name_primary = "vnetprimary"

#SECONDARY Virtual Network
network_name_secondary = "vnetsecondary"

#TrafficManager Virtual Network
network_name_tm = "vnettrafficmanager"


#SUBNETS


#PRIMARY Subnets

#Bastion Subnet - Primary
AzureBastionSubnet = "AzureBastionSubnet"

#Managment Subnet -Primary
managementsubnet1 = "managementsubnet1"

#Web Subnet -Primary
websubnet1 = "websubnet1"

#Buisness Subnet -Primary
businesssubnet1 = "businesssubnet1"

#Database Subnet -Primary
datasubnet1 = "databasesubnet1"

#ActiveDirectory Subnet -Primary
ADsubnet1 = "activedirectorysubent1"



#SECONDARY Subnets

#Managment Subnet -Secondary
managementsubnet2 = "managementsubnet2"

#Web Subnet -Secondary
websubnet2 = "websubnet2"

#Buisness Subnet -Secondary
businesssubnet2 = "businesssubnet2"

#Database Subnet -Secondary
datasubnet2 = "databasesubnet2"

#ActiveDirectory Subnet -Secondary
ADsubnet2 = "activedirectorysubent2"
#add variable subnet space


#OTHER SUBNETS

#Traffic Manager Subnet
trafficmanagersubnet = "trafficmanagersubnet"



#PEERING



#Primary to Secondary Peering
primarytosecondary = "primarytpsecondary"


#Secondary to Primary Peering
secondarytoprimary = "secondarytoprimary"






#LINIX BASTION HOST - IN PROGRESS


bastion_name = "bastion1"



#PIP
#linux1_pip_allocation_method = "Dynamic"

#linux1_VM
#linux1_publisher                = "Canonical"
#linux1_offer                    = "UbuntuServer"
#linux1_sku                      = "18.04-LTS"
#linux1_version                  = "latest"
#linux1_storage_os_disk_caching  = "ReadWrite"
#linux1_create_option            = "FromImage"
#linux1_managed_disk_type        = "Standard_LRS"
#linux1_os_profile_computer_name = "hostname"

#Security Variables
#security_rule_name                       = "allow-22"
#security_rule_priority                   = 100
#security_rule_direction                  = "Inbound"
#security_rule_access                     = "Allow"
#security_rule_protocol                   = "Tcp"
#security_rule_source_port_range          = "*"
#security_rule_destination_port_range     = "*"
#security_rule_source_address_prefix      = "*"
#security_rule_destination_address_prefix = "*"

#Vault Variables
#secrets_rg_name   = "secrets"
#secret_vault_name = "bjgsecrets"
