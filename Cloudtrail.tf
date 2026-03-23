
resource "aws_cloudtrail" "dataevent_cloudtrail" {
  name           = "dataevent-cloudtrail"                    #name of cloudtrail
  s3_bucket_name = aws_s3_bucket.cloudtrail_bucket.id

  enable_logging                = true
  include_global_service_events = false
  is_multi_region_trail         = false

  depends_on = [aws_s3_bucket_policy.cloudtrail_policy]

  event_selector {
    read_write_type           = "WriteOnly"
    include_management_events = false

    data_resource {
      type = "AWS::S3::Object"

      values = [
        "${aws_s3_bucket.import_bucket.arn}/"
      ]
    }
  }
}

