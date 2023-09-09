
resource "azurerm_resource_group" "staticwebresource" {
  name     = var.resource_group-name
  location = var.location

}


resource "random_string" "random_suffix" {
  length  = 8
  special = false
  upper   = false
}

locals {
  unique_storage = "${var.storage_account_name}${random_string.random_suffix.result}"
}

resource "azurerm_storage_account" "staticwebstorage" {
  name                     = local.unique_storage
  location                 = var.location
  resource_group_name      = var.resource_group-name
  account_tier             = "Standard"
  account_replication_type = "LRS"
  account_kind             = "StorageV2"


  static_website {
    index_document = "index.html"

  }

  depends_on = [ azurerm_resource_group.staticwebresource ]

}

resource "azurerm_storage_blob" "staticwebblob" {
  name                   = "index.html"
  storage_account_name   = local.unique_storage
  storage_container_name = "$web"
  type                   = "Block"
  content_type           = "text/html"
  source_content         = "<h1> Tolu is deploying a static web on azure storage using terraform </hi>"

  depends_on = [ azurerm_storage_account.staticwebstorage ]

}