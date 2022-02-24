#Variable Type Definaition File - To just define them, information is stored in variables.auto.tfvars.



#RESOURCE GROUPS


#Primary Region Name and Location
variable "resource_group_name_primary" {
  type = string
}

variable "location_primary" {
  type = string
}



#Secondary Region Name and Location
variable "resource_group_name_secondary" {
  type = string
}

variable "location_secondary" {
  type = string
}



#TrafficManager Region Name and Location
variable "resource_group_name_tm" {
  type = string
}

variable "location_tm" {
  type = string
}




#VIRTUAL NETWORKS


#Priamary Vnet
variable "network_name_primary" {
  type = string
}
#Secondary Vnet
variable "network_name_secondary" {
  type = string
}
#Traffic Management Vnet
variable "network_name_tm" {
  type = string
}



#SUBNETS



#PRIMARY Subnets

#Management Subnet -Primary
variable "managementsubnet1" {
  type = string
}

#Bastion Subnet - Primary
variable "AzureBastionSubnet" {
  type = string
}

#Web Subnet -Primary
variable "websubnet1" {
  type = string
}

#Buisness Subnet -Primary
variable "businesssubnet1" {
  type = string
}

#Database Subnet -Primary
variable "datasubnet1" {
  type = string
}

#Active Directory Subnet -Primary
variable "ADsubnet1" {
  type = string
}



#SECONDARY Subnets

#Management Subnet -Secondary
variable "managementsubnet2" {
  type = string
}

#Web Subnet -Secondary
variable "websubnet2" {
  type = string
}
#Buisness Subnet -Secondary
variable "businesssubnet2" {
  type = string
}

#Database Subnet -Secondary
variable "datasubnet2" {
  type = string
}

#Active Directory Subnet -Secondary
variable "ADsubnet2" {
  type = string
}



#OTHER SUBNETS

#Traffic Manager Subnet
variable "trafficmanagersubnet" {
  type = string
}



#PEERING

#Primary to Secondary Peering
variable "primarytosecondary" {
  type = string
}

#Secondary to Primary Peering
variable "secondarytoprimary" {
  type = string
}


#BASTION

variable "bastion_name"{
  type =string

}