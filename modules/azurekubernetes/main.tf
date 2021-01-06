# Create the cluster

locals {
  cluster_name = "${lower(var.project)}${lower(var.stage)}k8s"
}

//noinspection MissingProperty
resource "azurerm_kubernetes_cluster" "k8s" {
  name                = local.cluster_name
  location            = var.location
  resource_group_name = var.resource_group
  dns_prefix          = var.dns_prefix == "NONE" ? local.cluster_name : var.dns_prefix

  default_node_pool {
    name            = "default"
    node_count      = var.node_count
    vm_size         = var.vm_size
    os_disk_size_gb = var.node_storage
    max_pods        = var.max_pods
    vnet_subnet_id  = var.subnet_id
    type            = "VirtualMachineScaleSets"
    availability_zones = var.availability_zones
  }

  service_principal {
    client_id     = var.client_id
    client_secret = var.client_secret
  }

  kubernetes_version = var.kubernetes_version

  role_based_access_control {
    enabled = var.rbac_enabled
    azure_active_directory {
      client_app_id     = var.rbac_client_app_id
      server_app_id     = var.rbac_server_app_id
      server_app_secret = var.rbac_server_app_secret
    }
  }

  network_profile {
    network_plugin = "azure"
    network_policy = "calico"
    load_balancer_sku = "standard"
  }

  # TODO: workaround until https://github.com/terraform-providers/terraform-provider-azurerm/issues/6235 is fixed.
  lifecycle {
    ignore_changes = [
      windows_profile,
    ]
  }
}


resource "azurerm_kubernetes_cluster_node_pool" "second-pool" {
  count = var.second_node_pool_enabled ? 1 : 0

  name                    = var.second_node_pool_name
  kubernetes_cluster_id   = azurerm_kubernetes_cluster.k8s.id
  node_count              = var.second_node_pool_node_count
  vm_size                 = var.second_node_pool_vm_size
  os_disk_size_gb         = var.second_node_pool_node_storage
  max_pods                = var.second_node_pool_max_pods
  vnet_subnet_id          = var.subnet_id # https://www.terraform.io/docs/providers/azurerm/r/kubernetes_cluster_node_pool.html#vnet_subnet_id  
}
