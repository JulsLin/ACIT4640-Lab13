variable "vpc_id" {
  type        = string
  description = "ID of the VPC"
}

variable "route_table_id" {
  type        = string
  description = "ID of the route table"
}

variable "subnets" {
  type = map(object({
    cidr_block        = string
    availability_zone = string
    public            = bool
  }))
  description = "Map of subnets to create"
}
