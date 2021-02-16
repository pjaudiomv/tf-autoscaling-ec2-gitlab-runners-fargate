variable "vpc_id" {
  type    = string
  default = ""
}

variable "subnets" {
  type    = list(string)
  default = [""]
}

variable "ami" {
  type    = string
  default = "ami-02fe94dee086c0c37"
}

variable "instance_type" {
  type    = string
  default = "t3.micro"
}

variable "gitlab_url" {
  type    = string
  default = "https://gitlab.com"
}

variable "default_image" {
  type    = string
  default = "docker:latest"
}

variable "runner_tag_list" {
  type    = string
  default = "fargate"
}

variable "runner_request_concurrency" {
  type    = string
  default = "12"
}

variable "root_size" {
  type    = string
  default = "40"
}

variable "ssh_user" {
  type    = string
  default = "ubuntu"
}

variable "fargate_image" {
  type    = string
  default = "woodjme/autoscaling-ec2-gitlab-runners-fargate:latest"
}

variable "additional_runner_params" {
  type    = string
  default = ""
}

variable "cache_type" {
  type    = string
  default = "s3"
}

variable "cache_shared" {
  type    = string
  default = "true"
}

variable "cache_s3_server_address" {
  type    = string
  default = "s3.amazonaws.com"
}

variable "tags" {
  type    = map(string)
  default = {}
}

variable "gitlab_registration_token" {
  type    = string
  default = ""
}

variable "name" {
  type    = string
  default = "gitlab-ci-fargate"
}

variable "aws_region" {
  type  = string
  default = "us-east-1"
}
