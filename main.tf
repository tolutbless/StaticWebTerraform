
resource "azurerm_resource_group" "staticwebresource" {
  name     = var.resource_group-name
  location = var.location

}

resource "azurerm_storage_account" "staticwebstorage" {
  name                     = var.storage_account_name
  location                 = var.location
  resource_group_name      = var.resource_group-name
  account_tier             = "Standard"
  account_replication_type = "LRS"
  account_kind             = "StorageV2"


  static_website {
    index_document = "index.html"

  }

}

resource "azurerm_storage_blob" "staticwebblob" {
  name                   = "index.html"
  storage_account_name   = var.storage_account_name
  storage_container_name = "$web"
  type                   = "Block"
  content_type           = "text/html"
  source_content         = "<h1> Tolu is deploying a static web on azure storage using terraform </hi>"

}