# aws_s3_bucket.gitlab_ci_s3_cache:
resource "aws_s3_bucket" "gitlab_ci_s3_cache" {
  bucket_prefix = "${var.name}-s3-cache-"
  tags          = var.tags

  lifecycle_rule {
    abort_incomplete_multipart_upload_days = 0
    enabled                                = true
    tags                                   = {}

    expiration {
      days                         = 1
      expired_object_delete_marker = false
    }
  }

  versioning {
    enabled    = false
    mfa_delete = false
  }
}
