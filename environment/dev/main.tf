module "rg" {
  source     = "../../module/resource_group"
  rg_details = var.rgs
}

module "key_vault" {
  depends_on = [module.rg]
  source     = "../../module/Key_vault"
  key_vaults = var.key_vaults
}

module "vnet" {
  depends_on = [module.rg]
  source     = "../../module/virtual_network"
  vnets      = var.vnets
}

module "subnets" {
  depends_on = [module.vnet]
  source     = "../../module/virtual_subnet"
  subnets    = var.subnets
}

module "vms" {
  depends_on = [module.subnets, module.key_vault, module.rg]
  source     = "../../module/virtual_machine"
  vms        = var.vms
}

module "bastion" {
  depends_on = [module.subnets]
  source     = "../../module/Bastion_Host"
  bastions   = var.bastions
}