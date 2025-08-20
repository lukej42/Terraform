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
variable "resource_group_name" {
    type = string
}
variable "location" {
    type = string
}