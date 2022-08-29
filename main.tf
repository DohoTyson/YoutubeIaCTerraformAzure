# we need to add provider that we are going to use
terraform {
    # specify the cloud provider
    required_providers {
      azurerm = {
        source = "hashicorp/azurerm"
        version = "3.19.1"
      }
    }
}

# initialise the provider
provider "azurerm" {
  features {

  }
}

# we are creating resource group in azure
# the name on line 21 is not refelected on azure rather its used in tf
resource "azurerm_resource_group" "tf_rg_sampleapi" {
  name = "davidtfrg" # this is the name on azure 
  location = "uksouth" # specify the data center
}

# create the container group
resource "azurerm_container_group" "tf_cg_sampleapi" {
  name = "cg_sampleapi"
  location = azurerm_resource_group.tf_rg_sampleapi.location
  resource_group_name = azurerm_resource_group.tf_rg_sampleapi.name
  ip_address_type = "Public"
  dns_name_label = "sampleapitf"
  os_type = "Linux"
  container {
    name = "sampleapi"
    image = "dohotyson1990/sampleapi"
    cpu = "1"
    memory = "1"
    ports {
        port = 80
        protocol = "TCP"
    }
  }
}