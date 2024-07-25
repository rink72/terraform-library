locals {
  # Read configuration from yaml
  configuration    = yamldecode(file(var.configuration_path))
  location         = local.configuration["location"]
  service_code     = local.configuration["service_code"]
  owner            = local.configuration["owner"]
  context_code     = local.configuration["context_code"]
  environment      = local.configuration["environment"]
  environment_code = local.configuration["environment_code"]
  billing_code     = local.configuration["billing_code"]

  # Read region codes from yaml
  region_codes = yamldecode(file("${path.module}/../../../../data/regions.yml"))

  deployment_region_code = local.region_codes[local.location]
  resource_group_name    = "${local.service_code}-${local.context_code}-${local.environment_code}-${local.deployment_region_code}-rgp"
  resource_name          = "${local.service_code}-${local.context_code}-${local.environment_code}-${local.deployment_region_code}-oai"

  tags = {
    owner        = local.owner
    environment  = upper(local.environment)
    billing_code = local.billing_code
  }
}

resource "azurerm_resource_group" "resource_group" {
  name     = local.resource_group_name
  location = local.location
}

module "openai" {
  source = "modules/openai"

  name                = local.resource_name
  resource_group_name = azurerm_resource_group.resource_group.name
  location            = local.location
  tags                = local.tags
}
