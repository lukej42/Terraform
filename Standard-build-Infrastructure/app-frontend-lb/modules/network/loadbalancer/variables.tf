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
variable "nic_ids" {
  type = list(string)
}