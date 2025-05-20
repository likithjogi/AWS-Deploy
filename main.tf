provider "aws" {
  region = var.region

  default_tags {
    tags = {
      hashicorp-learn = "circleci"
    }
  }
}

resource "aws_s3_bucket" "developers" {
  bucket = "likith"
  tags = {
    description = "likith bucket"
  }
}

resource "aws_s3_bucket_object" "likith" {
    content = "likith.txt"
    key = "likith.txt"
    bucket = aws_s3_bucket.developers.id
}
