terraform {
  required_providers {
    yandex = {
      source  = "yandex-cloud/yandex"
      version = ">= 0.90.0"
    }
  }
}

data "cloudinit_config" "user_data" {
  gzip          = false
  base64_encode = true

  part {
    content_type = "text/cloud-config"
    content = templatefile("${path.module}/user-data.yaml.tpl", {
      key0 = var.ssh_public_key0
      #key1 = var.ssh_public_key1
    })
  }
}

resource "yandex_compute_disk" "boot-disk" {
  name     = var.vm_name
  type     = "network-ssd"
  zone     = var.zone
  size     = 10
  image_id = var.ubuntu_image_id
}

resource "yandex_compute_instance" "vm" {
  name                      = var.vm_name
  platform_id               = var.vm_platform_id
  allow_stopping_for_update = true
  labels                    = var.labels

  resources {
    cores         = 2
    memory        = 2
    core_fraction = 50
  }

  boot_disk {
    disk_id = yandex_compute_disk.boot-disk.id
  }

  network_interface {
    subnet_id          = var.subnet_id
    nat                = true
    security_group_ids = var.security_group_ids
  }

  metadata = {
    user-data = data.cloudinit_config.user_data.rendered
  }

  scheduling_policy {
    preemptible = var.preemptible
  }
}

output "vm-name" {
  value = yandex_compute_instance.vm.name
}

output "vm-external-ip" {
  value = yandex_compute_instance.vm.network_interface[0].nat_ip_address
}
