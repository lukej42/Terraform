variable "tenant_id" {
    type = string
}

variable "spobject_id" {
    type = string
}

variable "storagename" {
    type = string
}

variable "webappname" {
    type = string
}

variable "ostype" {
    type = string
}

variable "sku" {
    type = string
}

variable "subscription" {
    type = string
}

variable "appserviceplanname" {
    type = string
}

variable "location" {
  description = "Azure region"
  type        = string
  default     = "uksouth"
}

variable "resource_group_name" {
  type = string
}

variable "keyvaultname" {
    type = string
}

