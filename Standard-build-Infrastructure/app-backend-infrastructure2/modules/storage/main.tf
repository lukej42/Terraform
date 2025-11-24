resource "azurerm_storage_account" "storage" {
  name                     = var.storage_account_name
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = var.account_tier
  account_replication_type = var.account_replication_type

}
variable "container_names" {
  type = list(string)
  default = ["db-backup", "site-backup", "data"]
}

resource "azurerm_storage_container" "containers" {
  for_each = toset(var.container_names)

  name                  = each.value
  storage_account_id    = azurerm_storage_account.storage.id
  container_access_type = "private"
}