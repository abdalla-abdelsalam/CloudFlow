variable "vpc_cidr" {
  type        = string
  description = "this is cidr block for vpc"
}

variable "pub_subnet" {
  type = list(any)
}

variable "priv_subnet" {
  type = list(any)
}

variable "availability_zones" {
  type = list(any)
}


