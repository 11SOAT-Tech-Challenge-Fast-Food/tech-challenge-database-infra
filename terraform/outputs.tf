output "rds_endpoint" { value = aws_db_instance.postgres.address }
output "rds_port" { value = aws_db_instance.postgres.port }
output "rds_username" { value = aws_db_instance.postgres.username }
output "rds_db_name" { value = aws_db_instance.postgres.db_name }
