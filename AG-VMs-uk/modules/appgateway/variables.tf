variable "agname" {
    type = string
}
variable "location" {
    type = string
}
variable "resource_group_name" {
    type = string
}
variable "agsku" {
    type = string
}
variable "agtier" {
    type = string
}
variable "agcapacity" {
    type = string
}
variable "subnet_id" {

}
variable "public_ip_id" {

}
variable "backend_ips" {
  type = list(string)
}