data "terraform_remote_state" "state" {
  count   = var.backend_remote ? 1 : 0
  backend = "azurerm"
  config = {
    resource_group_name  = var.tf_resource_group_name
    storage_account_name = var.tf_storage_account_name
    container_name       = var.tf_container_name
    key                  = var.tf_blob_name
    access_key           = var.tf_access_key
  }
}

module "cosmotech-tenant" {
  source  = "Cosmo-Tech/cosmotech-tenant/azure"
  version = "0.2.8"

  subscription_id         = var.subscription_id
  tenant_id               = var.tenant_id
  client_id               = var.client_id
  client_secret           = var.client_secret
  tls_secret_name         = var.tls_secret_name
  namespace               = var.namespace
  monitoring_namespace    = var.monitoring_namespace
  chart_package_version   = var.chart_package_version
  owner_list              = var.owner_list
  project_name            = var.project_name
  cluster_name            = var.cluster_name
  platform_vnet           = var.platform_vnet
  vnet_iprange            = var.vnet_iprange
  platform_sp_name        = var.platform_sp_name
  platform_resource_group = var.platform_resource_group
  platform_public_ip      = var.platform_public_ip
  tenant_resource_group   = var.tenant_resource_group
  dns_record              = var.dns_record
  create_vault_entries    = var.create_vault_entries
  vault_addr              = var.vault_addr
  vault_token             = var.vault_token
  deployment_type         = var.deployment_type
  network_adt_clientid    = var.network_adt_clientid
  network_adt_password    = var.network_adt_password
  platform_client_id      = var.platform_tenant_client_id
  platform_client_secret  = var.platform_tenant_client_secret
  platform_group_id       = var.platform_group_id
  networkadt_sp_object_id = var.networkadt_sp_object_id
  principal_id            = var.platform_tenant_object_id
  platform_sp_object_id   = var.principal_id
  location                = var.location
}
