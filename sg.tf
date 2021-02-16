# aws_security_group.gitlab_ci_fargate:
resource "aws_security_group" "gitlab_ci_fargate" {
  name        = var.name
  description = "GitlabRunnerSecurityRules"
  egress = [
    {
      cidr_blocks = [
        "0.0.0.0/0",
      ]
      description      = ""
      from_port        = 0
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      protocol         = "-1"
      security_groups  = []
      self             = false
      to_port          = 0
    },
  ]

  ingress = [
    {
      cidr_blocks      = []
      description      = ""
      from_port        = 22
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      protocol         = "tcp"
      security_groups = [
        aws_security_group.gitlab_ci_fargate_spawner.id,
      ]
      self    = false
      to_port = 22
    },
    {
      cidr_blocks      = []
      description      = ""
      from_port        = 2376
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      protocol         = "tcp"
      security_groups = [
        aws_security_group.gitlab_ci_fargate_spawner.id,
      ]
      self    = false
      to_port = 2376
    },
  ]


  tags   = var.tags
  vpc_id = var.vpc_id
}
# aws_security_group.gitlab_ci_fargate_spawner:
resource "aws_security_group" "gitlab_ci_fargate_spawner" {
  name        = "${var.name}-spawner"
  description = "GitlabSpawnerSecurityRules"
  egress = [
    {
      cidr_blocks = [
        "0.0.0.0/0",
      ]
      description      = ""
      from_port        = 0
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      protocol         = "-1"
      security_groups  = []
      self             = false
      to_port          = 0
    },
  ]

  ingress = []

  tags   = var.tags
  vpc_id = var.vpc_id
}
