variable "project_name" {
  type = string
}

variable "environment" {

}

variable "aws_region" {
  type = string
}

variable "private_subnet_ids" {
  type = list(string)
}

variable "app_security_group_id" {
  type = string
}

variable "target_group_arn" {
  type = string
}

variable "container_port" {
  type = number
}

variable "ecr_repository_url" {
  type = string
}

variable "image_tag" {
  type = string
}

variable "desired_count" {
  type = number
}

variable "db_secret_arn" {
  type = string
}