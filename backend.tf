terraform {
   backend "s3" {
     bucket         = "s3-terraform-state-place-07"
     key            = "terraform/state/terraform-s3-static-website"
     region         = "us-east-1"
     dynamodb_table = "lock_table_tf"
     encrypt        = true
   }
 }
