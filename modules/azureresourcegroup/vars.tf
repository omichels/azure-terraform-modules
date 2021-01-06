variable "location" {
  type        = string
  description = "The azure location used for azure"
}

variable "project" {
  type        = string
  description = "Three letter project key"
}

variable "stage" {
  type        = string
  description = "Stage for this ressource group"
}

variable "suffix" {
  type        = string
  description = "Optional suffix for resource group (required when creating additional resource groups to the basic one"
  default     = ""
}