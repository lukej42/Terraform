variable "subscription" {
    type = string
}
variable "location" {
    type = string
}
variable "sp_names" {
  type    = list(string)
  default = ["rbac-1", "rbac-2", "rbac-3"]
}
variable "sp_roles" {
  description = "Map of service principal display names to their role assignments"
  type        = map(string)
  default     = {
    "rbac-1" = "Reader"
    "rbac-2" = "Reader"
    "rbac-3" = "Reader"
  }
}