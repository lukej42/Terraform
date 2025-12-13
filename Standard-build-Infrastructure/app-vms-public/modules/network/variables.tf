variable "subscription" {
    type = string
}
variable "location" {
    type = string
}
variable "resource_group_name" {

}
variable "virtual_network_name" {

}
variable "address_space" {
    type = list(string)
}
variable "subnet_name" {

}

variable "subnet_prefix" {
    type = list(string)
}
variable "nsgname" {

}
variable "name_prefix" {
  type        = string
}