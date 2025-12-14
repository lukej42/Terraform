variable "principal_id" {
  type        = string
  description = "The object ID of the identity"
}

variable "scope" {
  type        = string
  description = "Resource ID or scope for the role assignment"
}

variable "role" {
  type        = string
  default     = "Reader"
  description = "Azure built-in role name"
}