# tf-autoscaling-ec2-gitlab-runners-fargate

Terraform version of [autoscaling-ec2-gitlab-runners-fargate ](https://github.com/fedemzcor/autoscaling-ec2-gitlab-runners-fargate)

## Providers

| Name | Version |
|------|---------|
| aws | n/a |


## Resources

| Name |
|------|
| [aws_caller_identity](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) |
| [aws_cloudwatch_log_group](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_group) |
| [aws_ecs_cluster](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecs_cluster) |
| [aws_ecs_service](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecs_service) |
| [aws_ecs_task_definition](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecs_task_definition) |
| [aws_iam_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) |
| [aws_iam_role_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy) |
| [aws_iam_role_policy_attachment](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) |
| [aws_partition](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/partition) |
| [aws_region](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/region) |
| [aws_s3_bucket](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket) |
| [aws_secretsmanager_secret](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/secretsmanager_secret) |
| [aws_secretsmanager_secret_version](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/secretsmanager_secret_version) |
| [aws_security_group](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| additional\_runner\_params | n/a | `string` | `""` | no |
| ami | n/a | `string` | `"ami-02fe94dee086c0c37"` | no |
| cache\_s3\_server\_address | n/a | `string` | `"s3.amazonaws.com"` | no |
| cache\_shared | n/a | `string` | `"true"` | no |
| cache\_type | n/a | `string` | `"s3"` | no |
| default\_image | n/a | `string` | `"docker:latest"` | no |
| fargate\_image | n/a | `string` | `"woodjme/autoscaling-ec2-gitlab-runners-fargate:latest"` | no |
| gitlab\_registration\_token | n/a | `string` | `""` | no |
| gitlab\_url | n/a | `string` | `"https://gitlab.com"` | no |
| instance\_type | n/a | `string` | `"t3.micro"` | no |
| name | n/a | `string` | `"gitlab-ci-fargate"` | no |
| root\_size | n/a | `string` | `"40"` | no |
| runner\_request\_concurrency | n/a | `string` | `"12"` | no |
| runner\_tag\_list | n/a | `string` | `"fargate"` | no |
| ssh\_user | n/a | `string` | `"ubuntu"` | no |
| subnets | n/a | `list(string)` | <pre>[<br>  ""<br>]</pre> | no |
| tags | n/a | `map(string)` | `{}` | no |
| vpc\_id | n/a | `string` | `""` | no |

## Outputs

No output.
