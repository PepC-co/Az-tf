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

resource "azurerm_subnet" "tf_subnets" {
    count                = length(var.subnets)
    name                 = var.subnets[count.index]
    address_prefixes     = [cidrsubnet("10.10.0.0/16", 8, count.index)]
    resource_group_name  = azurerm_resource_group.tf_rg.name
    virtual_network_name = azurerm_virtual_network.tf_vnet.name
    
    depends_on           = [ azurerm_virtual_network.tf_vnet ]
}
