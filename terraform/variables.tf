variable "region" {
  description = "Region AWS"
  type        = string
  default     = "us-east-1"
}

variable "project_name" {
  description = "Nome do projeto / prefixo para recursos"
  type        = string
  default     = "ordermanagementdb"
}

variable "db_name" {
  description = "Nome do database inicial"
  type        = string
  default     = "ordermanagementdb"
}

variable "db_username" {
  description = "Usuario banco"
  type        = string
  default     = "db_user"
}

variable "db_password" {
  description = "Senha do banco (sensivel)"
  type        = string
  sensitive   = true
  default     = "db_password"
}

variable "cidr_vpc" {
  description = "CIDR block para a VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "vpc_id" {
  description = "VPC ID"
  type        = string
  default     = "vpc-04f2cb90a45a6cc21"
}

variable "projectName" {
  description = "Nome do projeto para prefixos e tags"
  type        = string
  default     = "tc-fiap-order-management-db"
}

variable "private_subnet_ids" {
  description = "Lista de IDs das subnets privadas para uso pelo RDS"
  type        = list(string)
  default     = ["subnet-0cd1d8ad2d130d766", "subnet-07fe9f660c1546b1c", "subnet-081ccd9184beb477d"]
}
