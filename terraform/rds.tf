resource "aws_db_subnet_group" "postgres_subnet_group" {
  name       = "${var.project_name}-subnet-group"
  subnet_ids = var.private_subnet_ids

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
