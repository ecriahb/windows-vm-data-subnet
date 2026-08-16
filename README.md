# Windows VM Infrastructure on Azure with Terraform

A modular Terraform project for deploying Windows virtual machine infrastructure on Azure with networking and supporting services.

## Architecture

```text
Resource Group
    ↓
Virtual Network
    ↓
Subnet
    ↓
Windows VM

Supporting modules:
- Azure Bastion
- Azure Key Vault
```

## Repository structure

```text
.
├── environment/
│   ├── dev/
│   │   ├── main.tf
│   │   ├── provider.tf
│   │   ├── Variables.tf
│   │   └── terraform.tfvars
│   └── qa/
└── module/
    ├── Bastion_Host/
    ├── Key_vault/
    ├── resource_group/
    ├── virtual_machine/
    ├── virtual_network/
    └── virtual_subnet/
```

The `dev` environment contains the active configuration. The `qa` folder currently exists as an environment placeholder.

## What this project demonstrates

- Modular Terraform design
- Azure Resource Group provisioning
- Virtual Network and Subnet creation
- Windows Virtual Machine deployment
- Azure Bastion integration
- Azure Key Vault integration
- Environment-based Terraform structure
- Reusable Infrastructure as Code components

## Prerequisites

- Terraform
- Azure CLI
- Azure subscription
- Azure authentication

```bash
az login
az account show
```

## Deployment workflow

```bash
cd environment/dev
terraform fmt -check
terraform init
terraform validate
terraform plan
terraform apply
```

Always review the plan before applying changes.

To clean up lab resources:

```bash
terraform destroy
```

## Terraform flow

```text
Environment configuration
        ↓
Module inputs
        ↓
Resource Group
        ↓
Networking
        ↓
VM and supporting Azure services
```

## Production considerations

For a production implementation, add or verify:

- Remote backend and state locking
- Separate state per environment
- Key Vault-backed secrets instead of plaintext credentials
- NSG rules based on least privilege
- Private management access where appropriate
- CI/CD plan and approval stages
- Terraform security scanning
- Resource naming and tagging standards
- Backup, monitoring and patching strategy

## Note

This repository is intended as an Infrastructure as Code project/lab. Review all variable values and Azure costs before applying it to a subscription.