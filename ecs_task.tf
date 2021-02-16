resource "aws_ecs_task_definition" "gitlab_ci_spawner" {
  family             = "${var.name}-spawner"
  execution_role_arn = aws_iam_role.gitlab_ci_ecs_execution.arn
  task_role_arn      = aws_iam_role.gitlab_ci_ecs_task.arn

  container_definitions = jsonencode(
    [
      {
        command               = []
        cpu                   = 0
        dnsSearchDomains      = []
        dnsServers            = []
        dockerLabels          = {}
        dockerSecurityOptions = []
        entryPoint            = []
        environment = [
          {
            name  = "ADDITIONAL_REGISTER_PARAMS"
            value = var.additional_runner_params
          },
          {
            name  = "AWS_AMI"
            value = var.ami
          },
          {
            name  = "AWS_DEFAULT_REGION"
            value = data.aws_region.current.name
          },
          {
            name  = "AWS_INSTANCE_TYPE"
            value = var.instance_type
          },
          {
            name  = "AWS_ROOT_SIZE"
            value = var.root_size
          },
          {
            name  = "AWS_SECURITY_GROUP"
            value = aws_security_group.gitlab_ci_fargate_spawner.name
          },
          {
            name  = "AWS_SSH_USER"
            value = var.ssh_user
          },
          {
            name  = "AWS_VPC_ID"
            value = var.vpc_id
          },
          {
            name  = "CACHE_S3_BUCKET_LOCATION"
            value = aws_s3_bucket.gitlab_ci_s3_cache.region
          },
          {
            name  = "CACHE_S3_BUCKET_NAME"
            value = aws_s3_bucket.gitlab_ci_s3_cache.bucket
          },
          {
            name  = "CACHE_S3_SERVER_ADDRESS"
            value = var.cache_s3_server_address
          },
          {
            name  = "CACHE_SHARED"
            value = var.cache_shared
          },
          {
            name  = "CACHE_TYPE"
            value = var.cache_type
          },
          {
            name  = "CI_SERVER_URL"
            value = var.gitlab_url
          },
          {
            name  = "DOCKER_IMAGE"
            value = var.default_image
          },
          {
            name  = "RUNNER_REQUEST_CONCURRENCY"
            value = var.runner_request_concurrency
          },
          {
            name  = "RUNNER_TAG_LIST"
            value = var.runner_tag_list
          },
        ]
        environmentFiles = []
        essential        = true
        extraHosts       = []
        image            = var.fargate_image
        links            = []
        logConfiguration = {
          logDriver = "awslogs"
          options = {
            awslogs-group         = aws_cloudwatch_log_group.gitlab_ci_ecs_log_group.name
            awslogs-region        = "us-east-1"
            awslogs-stream-prefix = "gitlab-runner-spawner"
          }
          secretOptions = []
        }
        mountPoints  = []
        name         = "gitlab-ci-fargate-gitlab-runner-spawner"
        portMappings = []
        secrets = [
          {
            name      = "REGISTRATION_TOKEN"
            valueFrom = aws_secretsmanager_secret.gitlab_reg_token.arn
          },
        ]
        systemControls = []
        ulimits        = []
        volumesFrom    = []
      },
    ]
  )
  cpu = "512"


  memory       = "1024"
  network_mode = "awsvpc"
  requires_compatibilities = [
    "FARGATE",
  ]

  tags = var.tags
}
