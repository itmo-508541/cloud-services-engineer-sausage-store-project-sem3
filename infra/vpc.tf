resource "yandex_vpc_network" "vpc-network" {
  name = var.network_name
}

resource "yandex_vpc_security_group" "vpc-security-group" {
  network_id  = yandex_vpc_network.vpc-network.id

  ingress {
    protocol       = "TCP"
    description    = "Allow HTTP"
    v4_cidr_blocks = [var.v4_cidr_block_dev, var.v4_cidr_block_prod]
    port           = 8200
  }

  ingress {
    protocol       = "TCP"
    description    = "Allow SSH"
    v4_cidr_blocks = [var.v4_cidr_block_dev, var.v4_cidr_block_prod]
    port           = 22
  }

  egress {
    protocol       = "ANY"
    description    = "Allow all egress traffic"
    v4_cidr_blocks = [var.v4_cidr_block_dev, var.v4_cidr_block_prod]
    port = -1
  }
}
