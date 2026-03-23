############################
# import an existing S3 Bucket for cloudtrail tracking

import {
  to = aws_s3_bucket.import_bucket
  identity = {
    bucket = "test-bucket-043207749130-ap-southeast-2-an"
  }
}

resource "aws_s3_bucket" "import_bucket" {
  ### Configuration omitted for brevity ###
}


############################
# S3 Bucket for CloudTrail to store data event logs

resource "aws_s3_bucket" "cloudtrail_bucket" {
  bucket        = "tf-test-trail-lo"
  force_destroy = true
}
