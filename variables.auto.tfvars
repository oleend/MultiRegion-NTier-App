#Variables Auto TfVars: Variable information


#RESOURCE GROUPS


#PRIMARY Name and Locaiton
resource_group_name_primary   = "primaryRG"
location_primary              = "eastus"

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






# BASTION HOST

#Bastion1
bastion_name = "bastion1"

#Bastion2
bastion_name2 = "bastion2"



#LoadBallencers

vnet1loadbalancer= "vnet1loadbalencer"

vnet2loadbalancer= "vnet2loadbalencer"


