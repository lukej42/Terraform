variable "location" {
    type = string
}
variable "resource_group_name" {
    type = string
}
variable "publicipname" {
    type = string
    default = null
}
variable "lbname" {
    type = string
}
variable "subscription" {
    type = string
}
variable "virtual_network_name" {
    type = string
}
variable "address_space" {
    type = list(string)
}
variable "subnet_name" {
    type = string
}
variable "subnet_prefix" {
    type = list(string)
}
variable "nsgname" {
    type = string
}
variable "networkinterface_names" {
  type = list(string)
}