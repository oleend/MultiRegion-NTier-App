#Resource Group
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

#First Vnet- sub1
resource "azurerm_subnet" "internal" {
  name                 = "internalSubnet"
  resource_group_name  = azurerm_resource_group.main.name
  virtual_network_name = azurerm_virtual_network.Network.name
  address_prefixes     = ["10.0.1.0/24"]
#vnet1 - sub2
resource "azurerm_subnet" "internal3" {
  name                 = "internalSubnet"
  resource_group_name  = azurerm_resource_group.main.name
  virtual_network_name = azurerm_virtual_network.Network.name
  address_prefixes     = ["10.0.2.0/24"]
#Vnet1- sub3
resource "azurerm_subnet" "internal" {
  name                 = "internalSubnet"
  resource_group_name  = azurerm_resource_group.main.name
  virtual_network_name = azurerm_virtual_network.Network.name
  address_prefixes     = ["10.0.3.0/24"]
#Vnet1- sub4
  resource "azurerm_subnet" "internal" {
  name                 = "internalSubnet"
  resource_group_name  = azurerm_resource_group.main.name
  virtual_network_name = azurerm_virtual_network.Network.name
  address_prefixes     = ["10.0.4.0/24"]
 #Vnet1- sub5
  resource "azurerm_subnet" "internal" {
  name                 = "internalSubnet"
  resource_group_name  = azurerm_resource_group.main.name
  virtual_network_name = azurerm_virtual_network.Network.name
  address_prefixes     = ["10.0.5.0/24"]



#Second Vnet- sub1
resource "azurerm_subnet" "internal" {
  name                 = "internalSubnet"
  resource_group_name  = azurerm_resource_group.main.name
  virtual_network_name = azurerm_virtual_network.Network2.name
  address_prefixes     = ["10.1.1.0/24"]
#vnet1 - sub2
  resource "azurerm_subnet" "internal" {
  name                 = "internalSubnet"
  resource_group_name  = azurerm_resource_group.main.name
  virtual_network_name = azurerm_virtual_network.Network2.name
  address_prefixes     = ["10.1.2.0/24"]
#vnet1 - sub3
  resource "azurerm_subnet" "internal" {
  name                 = "internalSubnet"
  resource_group_name  = azurerm_resource_group.main.name
  virtual_network_name = azurerm_virtual_network.Network2.name
  address_prefixes     = ["10.1.3.0/24"]
#vnet1 - sub4
  resource "azurerm_subnet" "internal" {
  name                 = "internalSubnet"
  resource_group_name  = azurerm_resource_group.main.name
  virtual_network_name = azurerm_virtual_network.Network2.name
  address_prefixes     = ["10.1.4.0/24"]
#vnet1 - sub5
  resource "azurerm_subnet" "internal" {
  name                 = "internalSubnet"
  resource_group_name  = azurerm_resource_group.main.name
  virtual_network_name = azurerm_virtual_network.Network2.name
  address_prefixes     = ["10.1.5.0/24"]
