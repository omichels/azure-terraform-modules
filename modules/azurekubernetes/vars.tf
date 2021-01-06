variable "project" {
  type        = string
  description = "Three letter project key"
}

variable "stage" {
  type        = string
  description = "Stage for this ip"
}

variable "location" {
  type        = string
  description = "Azure location to use"
}

variable "resource_group" {
  type        = string
  description = "Azure Resource Group to use"
}

variable "client_id" {
  type        = string
  description = "Azure client ID to use"
}

variable "client_secret" {
  type        = string
  description = "Azure client secret to use"
}

variable "dns_prefix" {
  type        = string
  description = "DNS-Prefix to use. Defaults to cluster name"
  default     = "NONE"
}

variable "node_count" {
  type        = string
  description = "Number of Kubernetes cluster nodes to use"
}

variable "vm_size" {
  type        = string
  description = "Type of vm to use. Use az vm list-sizes --location <location> to list all available sizes"
}

variable "kubernetes_version" {
  type        = string
  description = "Version of kubernetes to use"
  default     = "1.17.7"
}

variable "subnet_id" {
  type        = string
  description = "ID of subnet to host the nodes, pods and services in."
}

variable "rbac_enabled" {
  type        = string
  description = "Should RBAC be enabled on the cluster? If so, specify server_app_id and server_app_secret, too"
  default     = "false"
}

variable "rbac_client_app_id" {
  type        = string
  description = "ID of the client app for the rbac feature"
  default     = ""
}

variable "rbac_server_app_id" {
  type        = string
  description = "Id of the server app for the rbac features"
  default     = ""
}

variable "rbac_server_app_secret" {
  type        = string
  description = "Secret of the server app for the rbac features"
  default     = ""
}

variable "node_storage" {
  type        = string
  description = "Size of storage per node in GB"
  default     = "30"
}

variable "max_pods" {
  type        = string
  description = "Amount of pods allowed on each node (be aware that kubernetes system pods are also counted"
  default     = "30"
}

variable "availability_zones" {
  type        = list(number)
  description = "availability zones to spread the cluster nodes across, if omitted, only one avilability zone is used"
  default     = []
}

variable "second_node_pool_enabled" {
  type        = bool
  description = "set to true, if you want a seconde k8s nodepool"
  default     = false
}

variable "second_node_pool_name" {
  type        = string
  default     = "alternate"
}

variable "second_node_pool_node_count" {
  type        = string
  default     = 0
}

variable "second_node_pool_vm_size" {
  type        = string
  default     = ""
}

variable "second_node_pool_node_storage" {
  type        = string
  default     = 100
}

variable "second_node_pool_max_pods" {
  type        = string
  default     = 30
}
