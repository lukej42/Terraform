variable "subnet_id" {
  type = string
}

variable "location" {
  type = string
}

variable "resource_group_name" {
  type = string
}

variable "name_prefix" {
  type = string
}

variable "vmnames" {
  type        = list(string)
  description = "List of VM names"
}

variable "vmsize" {
  type = string
}

variable "vmusername" {
  type = string
}

variable "vmpassword" {
  type = string
}

