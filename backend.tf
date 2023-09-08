terraform {
  backend "azurerm" {
    resource_group_name  = "tolustaticweb2"
    storage_account_name = "terraformtolu2"
    container_name       = "tolucontainer2"
    key                  = "terraform.tfstate"

  }
}