resource "azurerm_role_assignment" "this" {
  scope                = var.scope
  role_definition_name = var.role
  principal_id         = var.principal_id
}