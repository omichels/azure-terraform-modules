output "ip" {
  value = azurerm_public_ip.public-ip.ip_address
}

output "resource_group" {
  value = var.resource_group
}

