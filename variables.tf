variable "location" {
  description = "the region where resources will be located on azure"
  default     = "westus"
}

variable "resource_group-name" {
  description = "the name of the resource group on azure"
  default     = "staticweb"

}

variable "storage_account_name" {
  description = "The name assigned to the storage account"
  default     = "tolustorage"

}