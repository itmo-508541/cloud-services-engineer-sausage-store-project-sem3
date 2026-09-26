output "vm_ip_address_dev" {
  value = module.vault-dev.vm-external-ip
}

output "vm_ip_address_prod" {
  value = module.vault-prod.vm-external-ip
}
