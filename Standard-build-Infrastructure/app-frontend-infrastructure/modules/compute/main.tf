resource "azurerm_linux_web_app" "webapp" {
  name                = var.appname
  location            = var.asplocation
  resource_group_name = var.rsg
  service_plan_id     = var.service_plan_id

  site_config {
    always_on = false
  }
  app_settings = {
    "WEBSITES_ENABLE_APP_SERVICE_STORAGE" = "false"
    APPINSIGHTS_INSTRUMENTATIONKEY             = azurerm_application_insights.insights.instrumentation_key
    APPLICATIONINSIGHTS_CONNECTION_STRING      = azurerm_application_insights.insights.connection_string
  }
}
resource "azurerm_application_insights" "insights" {
  name                = var.appname
  location            = var.asplocation
  resource_group_name = var.rsg
  application_type    = "web"
}