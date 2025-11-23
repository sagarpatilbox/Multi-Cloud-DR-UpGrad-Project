variable "azure_location" {
  description = "Azure location"
  type        = string
  default     = "eastus"
}

variable "project_name" {
  description = "Project name"
  type        = string
  default     = "multi-cloud-dr"
}

variable "admin_username" {
  description = "Admin username for VM"
  type        = string
  default     = "azureuser"
}

variable "public_key_path" {
  description = "Path to SSH public key"
  type        = string
}
