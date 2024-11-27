variable "domain_name" {
  type        = string
  description = "The domain name for the private hosted zone"
}

variable "vpc_id" {
  type        = string
  description = "ID of the VPC"
}

variable "records" {
  type = map(object({
    name = string
    ip   = string
  }))
}
