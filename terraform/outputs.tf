output "rds_endpoint" { value = aws_db_instance.postgres.address }
output "rds_port" { value = aws_db_instance.postgres.port }
output "rds_username" { value = aws_db_instance.postgres.username }
output "rds_db_name" { value = aws_db_instance.postgres.db_name }
output "db_schemas" { 
  value = var.db_schemas
  description = "Schemas criados no banco de dados para cada microsserviço"
}
output "customer_connection_info" {
  value = {
    host     = aws_db_instance.postgres.address
    port     = aws_db_instance.postgres.port
    database = aws_db_instance.postgres.db_name
    schema   = "customer"
    username = "customer_user"
  }
  description = "Informações de conexão para o microsserviço Customer"
}
output "payment_connection_info" {
  value = {
    host     = aws_db_instance.postgres.address
    port     = aws_db_instance.postgres.port
    database = aws_db_instance.postgres.db_name
    schema   = "payment"
    username = "payment_user"
  }
  description = "Informações de conexão para o microsserviço Payment"
}
output "product_connection_info" {
  value = {
    host     = aws_db_instance.postgres.address
    port     = aws_db_instance.postgres.port
    database = aws_db_instance.postgres.db_name
    schema   = "product"
    username = "product_user"
  }
  description = "Informações de conexão para o microsserviço Product"
}
