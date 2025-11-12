output "app_vm_ip" {
  description = "IP адрес сервера приложения"
  value       = libvirt_domain.app_vm.network_interface[0].addresses
}

output "db_vm_ip" {
  description = "IP адрес сервера базы данных"
  value       = libvirt_domain.db_vm.network_interface[0].addresses
}