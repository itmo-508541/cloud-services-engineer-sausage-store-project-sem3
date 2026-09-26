output "vm_dev_name" {
  value = module.vault-dev.vm-name
}

output "vm_dev_address" {
  value = module.vault-dev.vm-external-ip
}

output "vm_prod_name" {
  value = module.vault-prod.vm-name
}

output "vm_prod_address" {
  value = module.vault-prod.vm-external-ip
}
