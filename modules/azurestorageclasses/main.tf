resource "kubernetes_storage_class" "azurefile-sc-solr" {
  metadata {
    name = "azurefile-sc-solr"
  }
  storage_provisioner = "kubernetes.io/azure-file"
  reclaim_policy      = "Delete"
  mount_options = [ "file_mode=0770", "dir_mode=0770", "mfsymlinks", "uid=8983", "gid=8983", "nobrl", "cache=none" ]
  parameters = {
    skuName = "${var.sku_type}"
  }
}

resource "kubernetes_storage_class" "azurefile-sc-mongodb" {
  metadata {
    name = "azurefile-sc-mongodb"
  }
  storage_provisioner = "kubernetes.io/azure-file"
  reclaim_policy      = "Delete"
  mount_options = [ "file_mode=0770", "dir_mode=0770", "mfsymlinks", "uid=999", "gid=999", "nobrl", "cache=none" ]
  parameters = {
    skuName = "${var.sku_type}"
  }
}

resource "kubernetes_storage_class" "azurefile-sc-coremedia" {
  metadata {
    name = "azurefile-sc-coremedia"
  }
  storage_provisioner = "kubernetes.io/azure-file"
  reclaim_policy      = "Delete"
  mount_options = [ "file_mode=0770", "dir_mode=0770", "mfsymlinks", "uid=1000", "gid=1000", "nobrl", "cache=none" ]
  parameters = {
    skuName = "${var.sku_type}"
  }
}

resource "kubernetes_storage_class" "azurefile-sc-redis" {
  metadata {
    name = "azurefile-sc-redis"
  }
  storage_provisioner = "kubernetes.io/azure-file"
  reclaim_policy      = "Delete"
  mount_options = [ "file_mode=0770", "dir_mode=0770", "mfsymlinks", "uid=999", "gid=999" ]
  parameters = {
    skuName = "${var.sku_type}"
  }
}
