variable "subscription" {
    type = string
}
variable "storage_account_name" {
    type = string
}
variable "location" {
    type = string
}
variable "resource_group_name" {
    type = string
}
variable "account_tier" {
  default = "Standard"
}
variable "account_replication_type" {
  default = "LRS"
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
variable "vm-size" {
  type = string
}
variable "vm-name" {
  type = string
}
variable "keyvaultname" {
    type = string
}
variable "tenant_id" {
    type = string
}
variable "spobject_id" {
    type = string
}
variable "nsgname" {

}