output "host" {
  value = azurerm_kubernetes_cluster.k8s.kube_config[0].host
}

output "client_certificate" {
  value = azurerm_kubernetes_cluster.k8s.kube_config[0].client_certificate
}

output "client_key" {
  value = azurerm_kubernetes_cluster.k8s.kube_config[0].client_key
}

output "cluster_ca_certificate" {
  value = azurerm_kubernetes_cluster.k8s.kube_config[0].cluster_ca_certificate
}

output "fqdn" {
  value = azurerm_kubernetes_cluster.k8s.fqdn
}

output "node_resource_group" {
  value = azurerm_kubernetes_cluster.k8s.node_resource_group
}

output "cluster_name" {
  value = azurerm_kubernetes_cluster.k8s.name
}

output "client_certificate_admin" {
  value = azurerm_kubernetes_cluster.k8s.kube_admin_config[0].client_certificate
}

output "client_key_admin" {
  value = azurerm_kubernetes_cluster.k8s.kube_admin_config[0].client_key
}

output "client_token" {
  value = azurerm_kubernetes_cluster.k8s.kube_config[0].password
}

output "client_token_admin" {
  value = azurerm_kubernetes_cluster.k8s.kube_admin_config[0].password
}