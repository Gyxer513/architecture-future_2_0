variable "network_name" {
  description = "Имя виртуальной сети"
  type        = string
  default     = "app_network"
}

variable "base_image" {
  description = "Путь до qcow2 образа системы (в примере Ubuntu)"
  type        = string
  default     = "/var/lib/libvirt/images/ubuntu-22.04.qcow2"
}

variable "app_vm_name" {
  description = "Имя виртуальной машины приложения"
  type        = string
  default     = "app-vm"
}

variable "db_vm_name" {
  description = "Имя виртуальной машины базы данных"
  type        = string
  default     = "db-vm"
}