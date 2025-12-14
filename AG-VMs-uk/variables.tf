variable "subscription" {
    type = string
}
variable "location" {
    type = string
}
variable "resource_group_name" {
    type = string
}
variable "vmname" {
    type = string
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
variable networkinterface_name {
  type = string
}
variable "nsgname" {
  type = string
}
variable "name_prefix" {
  type = string
}
variable "agtier" {
  type = string
}
variable "agcapacity" {
  type = string
}
variable "agsku" {
  type = string
}
variable "agname" {
  type = string
}