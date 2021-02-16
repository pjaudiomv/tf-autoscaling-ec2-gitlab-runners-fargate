resource "aws_ecs_service" "gitlab_ci_ecs_service" {
  cluster                            = aws_ecs_cluster.gitlab_ci_ecs_cluster.id
  deployment_maximum_percent         = 200
  deployment_minimum_healthy_percent = 100
  desired_count                      = 1
  enable_ecs_managed_tags            = false
  health_check_grace_period_seconds  = 0
  launch_type                        = "FARGATE"
  name                               = "${var.name}-manager-service"
  platform_version                   = "LATEST"
  scheduling_strategy                = "REPLICA"
  tags                               = var.tags
  task_definition                    = aws_ecs_task_definition.gitlab_ci_spawner.arn

  deployment_controller {
    type = "ECS"
  }

  network_configuration {
    assign_public_ip = true
    security_groups = [
      aws_security_group.gitlab_ci_fargate_spawner.id,
    ]
    subnets = var.subnets
  }
}

resource "aws_ecs_cluster" "gitlab_ci_ecs_cluster" {
  capacity_providers = []
  name               = "${var.name}-manager-"
  tags               = {}

  setting {
    name  = "containerInsights"
    value = "disabled"
  }
}
