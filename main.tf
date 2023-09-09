
resource "azurerm_resource_group" "this" {
  name     = var.resource_group-name
  location = var.location

}


resource "random_string" "random_suffix" {
  length  = 8
  special = false
  upper   = false
}


resource "azurerm_storage_account" "this" {
  name                     = "${var.storage_account_name}${random_string.random_suffix.result}"
  location                 = var.location
  resource_group_name      = azurerm_resource_group.this.name
  account_tier             = "Standard"
  account_replication_type = "LRS"
  account_kind             = "StorageV2"


  static_website {
    index_document = "index.html"

  }

}

resource "azurerm_storage_blob" "this" {
  name                   = "index.html"
  storage_account_name   = azurerm_storage_account.this.name
  storage_container_name = "$web"
  type                   = "Block"
  content_type           = "text/html"
  source_content         = "<h1> Tolu is deploying a static web on azure storage using terraform </hi>"


}