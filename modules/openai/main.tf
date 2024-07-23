resource "azurerm_cognitive_account" "openai" {
  kind = "OpenAI"

  name                = var.name
  resource_group_name = var.resource_group_name
  location            = var.location
  sku_name            = "S0"

  local_auth_enabled = false

  tags = var.tags
}
