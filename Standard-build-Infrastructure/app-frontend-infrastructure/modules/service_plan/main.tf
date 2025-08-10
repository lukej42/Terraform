resource "azurerm_service_plan" "asp" {
  name                = var.aspname
  location            = var.asplocation
  resource_group_name = var.rsg

  os_type   = var.aspos            
  sku_name  = var.aspsku              

  lifecycle {
    prevent_destroy = true
  }
}