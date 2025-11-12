terraform {
  required_providers {
    libvirt = {
      source  = "dmacvicar/libvirt"
      version = "~> 0.9.0"
    }
  }
  required_version = ">= 1.5.0"
}

provider "libvirt" {
  uri = "qemu:///system"
}

# Сеть
resource "libvirt_network" "default" {
  name      = var.network_name
  mode      = "nat"
  addresses = ["192.168.122.0/24"]
}

# Образ-диск для виртуалок (копирование из базового qcow2)
resource "libvirt_volume" "base_image" {
  name   = "ubuntu-base.qcow2"
  pool   = "default"
  source = var.base_image
}

# Диск для App VM (копия базового)
resource "libvirt_volume" "app_disk" {
  name           = "${var.app_vm_name}.qcow2"
  pool           = "default"
  base_volume_id = libvirt_volume.base_image.id
}

# Диск для DB VM (копия базового)
resource "libvirt_volume" "db_disk" {
  name           = "${var.db_vm_name}.qcow2"
  pool           = "default"
  base_volume_id = libvirt_volume.base_image.id
}

# ВМ приложения
resource "libvirt_domain" "app_vm" {
  name   = var.app_vm_name
  memory = 2048
  vcpu   = 2

  network_interface {
    network_id = libvirt_network.default.id
  }

  disk {
    volume_id = libvirt_volume.app_disk.id
  }

  console {
    type        = "pty"
    target_type = "serial"
    target_port = "0"
  }
  graphics {
    type        = "vnc"
    listen_type = "address"
    autoport    = true
  }
}

# ВМ базы данных
resource "libvirt_domain" "db_vm" {
  name   = var.db_vm_name
  memory = 2048
  vcpu   = 2

  network_interface {
    network_id = libvirt_network.default.id
  }

  disk {
    volume_id = libvirt_volume.db_disk.id
  }

  console {
    type        = "pty"
    target_type = "serial"
    target_port = "0"
  }
  graphics {
    type        = "vnc"
    listen_type = "address"
    autoport    = true
  }
}