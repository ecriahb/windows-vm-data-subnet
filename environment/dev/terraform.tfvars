rgs = {
  rg1 = {
    rg_name     = "rg-dev-zelectric"
    location = "centralus"
  }
}

vnets = {
  vnet1 = {
    name                = "vnet-zelectric"
    resource_group_name = "rg-dev-zelectric"
    location            = "centralus"
    address_space       = ["10.0.0.0/16"]
  }
}

subnets = {
  subnet1 = {
    name             = "frontend-subnet"
    rg_name          = "rg-dev-zelectric"
    vnet_name        = "vnet-zelectric"
    address_prefixes = ["10.0.1.0/24"]
  }
  subnet2 = {
    name             = "AzureBastionSubnet"
    rg_name          = "rg-dev-zelectric"
    vnet_name        = "vnet-zelectric"
    address_prefixes = ["10.0.2.0/24"]
  }
}

vms = {
  vm1 = {
    subnet_name          = "frontend-subnet"
    virtual_network_name = "vnet-zelectric"
    resource_group_name  = "rg-dev-zelectric"
    nic_name             = "dhondhuvm-nic"
    location             = "centralus"
    vm_name              = "dhondhuvm"
    size                 = "Standard_B1s"
    kv_name              = "kv786test7862811"
  }
}

bastions = {
  bastion1 = {
    vnet_name    = "vnet-zelectric"
    rg_name      = "rg-dev-zelectric"
    pip_name     = "ze-pip-bastion"
    location     = "centralus"
    bastion_name = "bastion-zelectic"
  }
}

key_vaults = {
  kv1 = {
    kv_name  = "kv786test7862811"
    location = "centralus"
    rg_name  = "rg-dev-zelectric"
  }
}