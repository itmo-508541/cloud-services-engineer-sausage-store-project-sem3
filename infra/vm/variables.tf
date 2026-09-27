variable "ubuntu_image_id" {
  type    = string
  default = "fd83ica41cade1mj35sr"
}

variable "vm_name" {
  type = string
}

variable "vm_platform_id" {
  type    = string
  default = "standard-v3"
}

variable "ssh_public_key0" {
  type = string
}

variable "ssh_public_key1" {
  type = string
}

variable "subnet_id" {
  type = string
}

variable "zone" {
  type = string
}

variable "security_group_ids" {
  type    = list(string)
  default = []
}

variable "preemptible" {
  type    = bool
  default = true
}

variable "labels" {
  type = map(string)
}
