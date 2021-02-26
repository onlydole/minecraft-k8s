# see https://registry.terraform.io/modules/Azure/aks/azurerm/4.7.0
module "aks" {
  source  = "Azure/aks/azurerm"
  version = "4.8.0"

  kubernetes_version   = var.cluster_version
  orchestrator_version = var.cluster_version
  resource_group_name  = azurerm_resource_group.project.name
  prefix               = var.project_name
  agents_min_count     = 1
  agents_count         = 3
  agents_max_count     = 5
  vnet_subnet_id       = module.network.vnet_subnets[0]
  os_disk_size_gb      = 100
  enable_auto_scaling  = true

  # see https://www.terraform.io/docs/language/meta-arguments/depends_on.html
  depends_on = [
    module.network
  ]
}
