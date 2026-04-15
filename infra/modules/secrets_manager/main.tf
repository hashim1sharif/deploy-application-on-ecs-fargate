resource "aws_secretsmanager_secret" "db_secret" {
  name = "${var.project_name}-${var.environment}-db-secret"

  tags = {
    Name        = "${var.project_name}-${var.environment}-db-secret"
    Environment = var.environment
  }
}

resource "aws_secretsmanager_secret_version" "db_secret_version" {
  secret_id = aws_secretsmanager_secret.db_secret.id

  secret_string = jsonencode({
    username     = var.db_username
    password     = var.db_password
    engine       = "postgres"
    host         = var.db_host
    port         = var.db_port
    dbname       = var.db_name
    database_url = "postgresql://${var.db_username}:${var.db_password}@${var.db_host}:${var.db_port}/${var.db_name}"
  })
}