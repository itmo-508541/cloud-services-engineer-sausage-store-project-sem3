resource "yandex_vpc_subnet" "vpc-subnet-dev" {
  v4_cidr_blocks = [var.v4_cidr_block_dev]
  network_id     = yandex_vpc_network.vpc-network.id
}

module "vault-dev" {
    source = "./vm"
    vm_name         = "Vault.Dev"
    ssh_public_key0  = var.ssh_public_key0
#    ssh_public_key1  = var.ssh_public_key1
    subnet_id       = yandex_vpc_subnet.vpc-subnet-dev.id
    zone            = var.zone
}
