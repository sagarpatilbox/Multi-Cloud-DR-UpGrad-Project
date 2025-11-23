output "app_vm_public_ip" {
  value       = azurerm_public_ip.app_pip.ip_address
  description = "Public IP of Azure App VM"
}