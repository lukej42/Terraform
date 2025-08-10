variable "subscription" {
    type = string
}
variable "aspname" {
    type = string
}
variable "asplocation" {
    type = string
}
variable "rsg" {
    type = string
}
variable "aspos" {
    type = string
}
variable "aspsku" {
    type = string
}
variable "appname" {
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