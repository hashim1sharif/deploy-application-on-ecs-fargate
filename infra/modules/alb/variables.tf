# variable "project_name" {}
# variable "environment" {}
# variable "vpc_id" {}
# variable "public_subnet_ids" {}
# variable "container_port" {}


variable "project_name" {
  type = string
}

variable "environment" {
  type = string
}

variable "vpc_id" {
  type = string
}

variable "public_subnet_ids" {
  type = list(string)
}

variable "container_port" {
  type = number
}

variable "certificate_arn" {
  type = string

}