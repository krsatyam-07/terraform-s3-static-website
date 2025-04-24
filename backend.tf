# terraform {
#   backend "s3" {
#     bucket         = "sagemaker-us-east-1-604981384368"
#     key            = "terraform/state"
#     region         = "us-east-1"
#     dynamodb_table = "lock_table_tf"
#     encrypt        = true
#   }
# }