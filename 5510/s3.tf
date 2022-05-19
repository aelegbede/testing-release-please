
locals {
    name_prefix = "${var.project_name}-${var.application_name}"

}

resource "aws_s3_bucket" "tfstate" {
  bucket        = "${local.name_prefix}-tfstate-${random_id.random.hex}"
  force_destroy = var.force_destroy

  tags = {
    Project     = var.project_name
    Application = var.application_name
  }

  lifecycle {
    ignore_changes = [tags, logging]
  }
}

resource "aws_s3_bucket_acl" "tfstate" {
  bucket = aws_s3_bucket.tfstate.id
  acl    = "private"
}

resource "aws_s3_bucket_versioning" "tfstate" {
  bucket = aws_s3_bucket.tfstate.id
  versioning_configuration {
    status = "Enabled"
  }
}


