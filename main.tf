provider "aws" {
  region = var.region

  default_tags {
    tags = {
      hashicorp-learn = "circleci"
    }
  }
}

resource "aws_s3_bucket" "projectname" {
  bucket = var.bucketname
  tags = {
    description = "likith bucket"
  }
}

#resource "aws_s3_object" "projectname" {
#    content = "likithcontent"
#    key = "likith.txt"
#    bucket = aws_s3_bucket.projectname.id
#}
