resource "azurerm_resource_group" "tf_rg" {
    name                = "from-tf"
    location            = "Central India"
}


resource "azurerm_network_security_group" "tf_nsg" {
    name                = "tf-security-group"
    resource_group_name = azurerm_resource_group.tf_rg.name
    location            = azurerm_resource_group.tf_rg.location

    depends_on          = [ azurerm_resource_group.tf_rg ]
}


resource "azurerm_virtual_network" "tf_vnet" {
    name                = "tf-network"
    address_space       = [ "10.10.0.0/16" ]
    resource_group_name = azurerm_resource_group.tf_rg.name
    location            = azurerm_resource_group.tf_rg.location

    depends_on          = [ azurerm_resource_group.tf_rg ]
}

resource "azurerm_subnet" "tf_subnet1" {
    name                 = "terra-subnet1"
    address_prefixes     = [ "10.10.0.0/24" ]
    resource_group_name  = azurerm_resource_group.tf_rg.name
    virtual_network_name = azurerm_virtual_network.tf_vnet.name
    
    depends_on           = [ azurerm_virtual_network.tf_vnet ]
}

resource "azurerm_subnet" "tf_subnet2" {
    name                 = "terra-subnet2"
    address_prefixes     = [ "10.10.1.0/24" ]
    resource_group_name  = azurerm_resource_group.tf_rg.name
    virtual_network_name = azurerm_virtual_network.tf_vnet.name
    
    depends_on           = [ azurerm_subnet.tf_subnet1 ]
}

resource "azurerm_subnet" "tf_subnet3" {
    name                 = "terra-subnet3"
    address_prefixes     = [ "10.10.2.0/24" ]
    resource_group_name  = azurerm_resource_group.tf_rg.name
    virtual_network_name = azurerm_virtual_network.tf_vnet.name
    
    depends_on           = [ azurerm_subnet.tf_subnet2]
}

resource "azurerm_subnet" "tf_subnet4" {
    name                 = "terra-subnet4"
    address_prefixes     = [ "10.10.3.0/24" ]
    resource_group_name  = azurerm_resource_group.tf_rg.name
    virtual_network_name = azurerm_virtual_network.tf_vnet.name
    
    depends_on           = [ azurerm_subnet.tf_subnet3 ]
}

resource "azurerm_subnet" "tf_subnet5" {
    name                 = "terra-subnet5"
    address_prefixes     = [ "10.10.4.0/24" ]
    resource_group_name  = azurerm_resource_group.tf_rg.name
    virtual_network_name = azurerm_virtual_network.tf_vnet.name
    
    depends_on           = [ azurerm_subnet.tf_subnet4 ]
}

resource "azurerm_subnet" "tf_subnet6" {
    name                 = "terra-subnet6"
    address_prefixes     = [ "10.10.5.0/24" ]
    resource_group_name  = azurerm_resource_group.tf_rg.name
    virtual_network_name = azurerm_virtual_network.tf_vnet.name
    
    depends_on           = [ azurerm_subnet.tf_subnet5 ]
}