variable "cloud_id" {
  type = string
}

variable "folder_id" {
  type = string
}

variable "zone" {
  type = string
}

variable "network_name" {
  type = string
}

variable "v4_cidr_block_dev" {
  type    = string
  default = "192.168.1.0/24"
}

variable "v4_cidr_block_prod" {
  type    = string
  default = "192.168.2.0/24"
}

variable "ssh_public_key0" {
  type = string
}

variable "ssh_public_key1" {
  type = string
}
