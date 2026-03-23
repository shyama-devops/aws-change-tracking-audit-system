
############################
# Lambda Function 

resource "aws_lambda_function" "lambda" {
  function_name = "tracking-lambda-function"

  role    = aws_iam_role.lambda_exec_role.arn
  runtime = "python3.11"
  handler = "lambda_function.lambda_handler"

  s3_bucket = "lambda-functi"
  s3_key    = "audit-funtion/lambda_function.zip"

  timeout     = 30
  memory_size = 256

  depends_on = [
    aws_iam_role_policy_attachment.lambda_basic,
    aws_iam_role_policy_attachment.lambda_ses_custom,
    aws_iam_role_policy_attachment.lambda_s3_read
  ]
}



############################
# Allow S3 to invoke Lambda

resource "aws_lambda_permission" "allow_s3" {
  statement_id  = "AllowS3Invoke"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.lambda.function_name
  principal     = "s3.amazonaws.com"

  source_arn = aws_s3_bucket.cloudtrail_bucket.arn
}

############################
# S3 Notification (Trigger)
############################
resource "aws_s3_bucket_notification" "bucket_notification" {
  bucket = aws_s3_bucket.cloudtrail_bucket.id

  lambda_function {
    lambda_function_arn = aws_lambda_function.lambda.arn
    events              = ["s3:ObjectCreated:*"]

    
    filter_prefix = "AWSLogs/"
    filter_suffix = ".json.gz"
  }

  depends_on = [
    aws_lambda_permission.allow_s3
  ]
}
