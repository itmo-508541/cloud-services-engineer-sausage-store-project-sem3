resource "yandex_vpc_subnet" "vpc-subnet-prod" {
  v4_cidr_blocks = [var.v4_cidr_block_prod]
  network_id     = yandex_vpc_network.vpc-network.id
}

module "vault-prod" {
  source             = "./vm"
  vm_name            = "vm-prod"
  ssh_public_key0    = var.ssh_public_key0
  ssh_public_key1    = var.ssh_public_key1
  subnet_id          = yandex_vpc_subnet.vpc-subnet-prod.id
  zone               = var.zone
  security_group_ids = [yandex_vpc_security_group.vpc-security-group.id]
  preemptible        = false
  labels = {
    project = "sausage-store"
    env     = "prod"
  }
}
