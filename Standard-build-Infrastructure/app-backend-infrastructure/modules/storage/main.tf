resource "azurerm_storage_account" "storage" {
  name                     = var.storage_account_name
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = var.account_tier
  account_replication_type = var.account_replication_type

}
resource "azurerm_storage_container" "db_bk" {
  name                  = "db-backup"
  storage_account_id    = azurerm_storage_account.storage.id
  container_access_type = "private"
}
resource "azurerm_storage_container" "site_bk" {
  name                  = "site-backup"
  storage_account_id    = azurerm_storage_account.storage.id
  container_access_type = "private"
}
resource "azurerm_storage_container" "data" {
  name                  = "data"
  storage_account_id    = azurerm_storage_account.storage.id
  container_access_type = "private"
}