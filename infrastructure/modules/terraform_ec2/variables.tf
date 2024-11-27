variable "instances" {
  type = map(object({
    ami           = string
    instance_type = string
    subnet_id     = string
    hostname      = string
  }))
}

variable "key_name" {
  type        = string
  description = "Key pair name for SSH"
}

variable "security_group_id" {
  type        = string
  description = "Security group ID"
}
