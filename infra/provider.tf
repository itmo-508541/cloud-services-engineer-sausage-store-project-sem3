terraform {
  required_providers {
    yandex = {
      source  = "yandex-cloud/yandex"
      version = ">= 0.90.0"
    }
  }

  backend "http" {
  }
}

provider "yandex" {
  service_account_key_file = "yandex-sa.json"
  cloud_id  = var.cloud_id
  folder_id = var.folder_id
  zone      = var.zone
}
