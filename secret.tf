# aws_secretsmanager_secret.gitlab_reg_token:
resource "aws_secretsmanager_secret" "gitlab_reg_token" {
  description = "The Gitlab runer registration token"
  name_prefix = "${var.name}-gitLabRegistrationToken"
  tags        = var.tags
}

resource "aws_secretsmanager_secret_version" "gitlab_reg_token" {
  secret_id     = aws_secretsmanager_secret.gitlab_reg_token.id
  secret_string = var.gitlab_registration_token
}
