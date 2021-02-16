resource "aws_iam_role" "gitlab_ci_ecs_execution" {
  name = "${var.name}-ecs-execution-role"
  assume_role_policy = jsonencode(
    {
      Statement = [
        {
          Action = "sts:AssumeRole"
          Effect = "Allow"
          Principal = {
            Service = "ecs-tasks.amazonaws.com"
          }
        },
      ]
      Version = "2012-10-17"
    }
  )
  force_detach_policies = false
  max_session_duration  = 3600
  path                  = "/"
  tags                  = var.tags
}

resource "aws_iam_role_policy" "gitalb_secret" {
  name = "${var.name}-registration-token"
  role = aws_iam_role.gitlab_ci_ecs_execution.name

  policy = jsonencode(
    {
      Statement = [
        {
          Action = [
            "secretsmanager:DescribeSecret",
            "secretsmanager:GetSecretValue",
          ]
          Effect   = "Allow"
          Resource = aws_secretsmanager_secret.gitlab_reg_token.arn
        },
      ]
    }
  )
}

# aws_iam_role_policy_attachment.gitlab_ci_ecs_execution:
resource "aws_iam_role_policy_attachment" "gitlab_ci_ecs_execution" {
  policy_arn = "arn:${data.aws_partition.current.partition}:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
  role       = aws_iam_role.gitlab_ci_ecs_execution.name
}
# aws_iam_role.gitlab_ci_ecs_task:
resource "aws_iam_role" "gitlab_ci_ecs_task" {
  name = "${var.name}-ecs-task-role"
  assume_role_policy = jsonencode(
    {
      Statement = [
        {
          Action = "sts:AssumeRole"
          Effect = "Allow"
          Principal = {
            Service = "ecs-tasks.amazonaws.com"
          }
        },
      ]
      Version = "2012-10-17"
    }
  )

  force_detach_policies = false
  max_session_duration  = 3600

  path = "/"
  tags = var.tags
}

resource "aws_iam_role_policy" "gitalb_s3_cache" {
  name = "${var.name}-access-s3-cache"
  role = aws_iam_role.gitlab_ci_ecs_execution.name
  policy = jsonencode(
    {
      Statement = [
        {
          Action = [
            "s3:ListObjects*",
            "s3:GetObject*",
            "s3:DeleteObject*",
            "s3:PutObject*",
            "s3:ListBucket",
          ]
          Effect = "Allow"
          Resource = [
            "${aws_s3_bucket.gitlab_ci_s3_cache.arn}/*",
            aws_s3_bucket.gitlab_ci_s3_cache.arn
          ]
        },
      ]
    }
  )
}

# aws_iam_role_policy_attachment.gitlab_ci_ecs_task:
resource "aws_iam_role_policy_attachment" "gitlab_ci_ecs_task" {
  policy_arn = "arn:${data.aws_partition.current.partition}:iam::aws:policy/AmazonEC2FullAccess"
  role       = aws_iam_role.gitlab_ci_ecs_task.name
}
