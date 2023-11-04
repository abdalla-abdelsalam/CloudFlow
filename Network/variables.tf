variable "cidr" {
  type        = string
  description = "this is cidr block for vpc"
}

variable "sub_pub" {
  type = list(any)
}

variable "azs" {
  type = list(any)
}

variable "sub_priv" {
  type = list(any)
}
