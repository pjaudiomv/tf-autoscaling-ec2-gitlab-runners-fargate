# aws_cloudwatch_log_group.gitlab_ci_ecs_log_group:
resource "aws_cloudwatch_log_group" "gitlab_ci_ecs_log_group" {
  name              = "${var.name}-ecs-log-group"
  retention_in_days = 14
  tags              = var.tags
}
