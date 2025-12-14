variable "agname" {
  description = "Name of the Application Gateway"
  type        = string
}

variable "resource_group_name" {
  description = "Resource group name"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
}

variable "subnet_id" {
  description = "Subnet ID for Application Gateway"
  type        = string
}

variable "public_ip_id" {
  description = "Public IP ID for Application Gateway frontend"
  type        = string
}

variable "agsku" {
  description = "Application Gateway SKU name"
  type        = string
}

variable "agtier" {
  description = "Application Gateway SKU tier"
  type        = string
}

variable "agcapacity" {
  description = "Application Gateway capacity"
  type        = number
}

variable "vm_nic_ids" {
  description = "List of VM NIC IDs to associate with backend pool"
  type        = list(string)
}
