resource "azurerm_resource_group" "tf_rg" {
    name                = "from-tf"
    location            = "Central India"
}


resource "azurerm_network_security_group" "tf_nsg" {
    name                = "tf-security-group"
    resource_group_name = azurerm_resource_group.tf_rg.name
    location            = azurerm_resource_group.tf_rg.location
}


resource "azurerm_virtual_network" "tf_vnet" {
    name                = "tf-network"
    resource_group_name = azurerm_resource_group.tf_rg.name
    location            = azurerm_resource_group.tf_rg.location
    address_space       = ["192.168.0.0/16"]

}