variable "cidr_block" {
  type        = string
  description = "CIDR block for the VPC"
}

variable "enable_dns_hostnames" {
  type        = bool
  description = "Enable DNS hostnames for the VPC"
}
