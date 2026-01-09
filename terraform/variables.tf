variable "region" {
  description = "Region AWS"
  type        = string
  default     = "us-east-1"
}

variable "project_name" {
  description = "Nome do projeto / prefixo para recursos"
  type        = string
  default     = "tech-challenge-ordermanagement"
}

variable "db_name" {
  description = "Nome do database inicial"
  type        = string
  default     = "ordermanagementdb"
}

variable "db_schemas" {
  description = "Schemas criados para os microsserviços"
  type        = list(string)
  default     = ["customer", "payment", "product"]
}

variable "db_username" {
  description = "Usuario banco"
  type        = string
  default     = "" #ordermanagement
}

variable "db_password" {
  description = "Senha do banco (sensivel)"
  type        = string
  sensitive   = true
  default     = "" #passdb12345
}

variable "customer_password" {
  description = "Senha do usuário customer_user"
  type        = string
  sensitive   = true
  default     = "" # senha para customer
}

variable "payment_password" {
  description = "Senha do usuário payment_user"
  type        = string
  sensitive   = true
  default     = "" # senha para payment
}

variable "product_password" {
  description = "Senha do usuário product_user"
  type        = string
  sensitive   = true
  default     = "" # senha para product
}

variable "cidr_vpc" {
  description = "CIDR block para a VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "projectName" {
  description = "Nome do projeto para prefixos e tags"
  type        = string
  default     = "tech-challenge-ordermanagement"
}

# variable "private_subnet_ids" {
#   description = "Lista de IDs das subnets privadas para uso pelo RDS"
#   type        = list(string)
#   default     = ["subnet-0cd1d8ad2d130d766", "subnet-07fe9f660c1546b1c", "subnet-081ccd9184beb477d"]
# }
