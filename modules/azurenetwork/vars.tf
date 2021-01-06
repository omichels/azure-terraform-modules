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

variable "network_cidr" {
  type        = list(string)
  description = "The address space to use for the complete network"
}

variable "dns_servers" {
  type = list(string)
  description = "DNS servers to use for the adress space"
  default = []
}

variable "default_subnet_cidr" {
  type        = string
  description = "CIDR of the default subnet"
}

variable "public_ip" {
  type = string
  description = "Public IP for which the NSG shall be made open to"
}

#variable "peerings" {
#  type        = map # TODO-LATER correct?
#  description = "Virtual networks to peer to"
#}

