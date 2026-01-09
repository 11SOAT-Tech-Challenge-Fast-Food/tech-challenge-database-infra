resource "aws_db_subnet_group" "postgres_subnet_group" {
  name       = "${var.project_name}-subnet-group"
  subnet_ids = data.terraform_remote_state.core.outputs.subnet_id

  tags = {
    Name = "${var.project_name}-subnet-group"
  }
}

resource "aws_db_instance" "postgres" {
  identifier = "${var.project_name}-postgres"
  engine     = "postgres"
  # engine_version          = "15.3" Default por causa do LabRole
  instance_class    = "db.t3.micro"
  allocated_storage = 20

  db_name  = var.db_name
  username = var.db_username
  password = var.db_password

  db_subnet_group_name   = aws_db_subnet_group.postgres_subnet_group.name
  vpc_security_group_ids = [aws_security_group.rds_sg.id]

  publicly_accessible = true
  skip_final_snapshot = true

  backup_retention_period = 7
  maintenance_window      = "Mon:05:00-Mon:06:00"
}

# Recurso para executar o script de inicialização dos schemas
resource "null_resource" "init_schemas" {
  depends_on = [aws_db_instance.postgres]

  provisioner "local-exec" {
    command = <<-EOT
      until PGPASSWORD=${var.db_password} psql -h ${aws_db_instance.postgres.address} -U ${var.db_username} -d ${var.db_name} -c '\q' 2>/dev/null; do
        echo "Aguardando banco de dados ficar disponível..."
        sleep 5
      done
      
      echo "Executando script de inicialização dos schemas..."
      export CUSTOMER_PASS=${var.customer_password}
      export PAYMENT_PASS=${var.payment_password}
      export PRODUCT_PASS=${var.product_password}
      
      PGPASSWORD=${var.db_password} psql -h ${aws_db_instance.postgres.address} -U ${var.db_username} -d ${var.db_name} \
        -v customer_password="$CUSTOMER_PASS" \
        -v payment_password="$PAYMENT_PASS" \
        -v product_password="$PRODUCT_PASS" \
        -v db_name=${var.db_name} \
        -f ${path.module}/init-schemas.sql
    EOT
  }

  triggers = {
    sql_file_hash = filemd5("${path.module}/init-schemas.sql")
    db_instance   = aws_db_instance.postgres.id
  }
}
