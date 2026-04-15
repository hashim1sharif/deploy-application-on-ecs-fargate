variable "project_name" {}

variable "environment" {}

variable "db_username" {}

variable "db_password" {
  type      = string
  sensitive = true
}

variable "db_name" {}

variable "db_host" {}

variable "db_port" {}