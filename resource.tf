# Create the S3 bucket
resource "aws_s3_bucket" "static_website_bucket" {
  bucket = "s3bucketthalaforareason077-${terraform.workspace}"
}

# Disable Block Public Access settings at the bucket level
resource "aws_s3_bucket_public_access_block" "static_website_bucket" {
  bucket = aws_s3_bucket.static_website_bucket.id

  block_public_acls       = false # Allow public ACLs
  block_public_policy     = false # Allow public policies
  ignore_public_acls      = false # Do not ignore public ACLs
  restrict_public_buckets = false # Do not restrict public buckets
}

# Upload the index.html file
resource "aws_s3_object" "index" {
  bucket       = aws_s3_bucket.static_website_bucket.id
  key          = "index.html"
  source       = "index.html"
  content_type = "text/html"
}

# Upload the error.html file
resource "aws_s3_object" "error" {
  bucket       = aws_s3_bucket.static_website_bucket.id
  key          = "error.html"
  source       = "error.html"
  content_type = "text/html"
}

# Configure the bucket as a static website
resource "aws_s3_bucket_website_configuration" "static_website_config" {
  bucket = aws_s3_bucket.static_website_bucket.id

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }
}

# Apply a public read-access bucket policy
resource "aws_s3_bucket_policy" "public_read_access" {
  bucket = aws_s3_bucket.static_website_bucket.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect    = "Allow"
        Principal = "*"
        Action    = "s3:GetObject"
        Resource = [
          "${aws_s3_bucket.static_website_bucket.arn}",
          "${aws_s3_bucket.static_website_bucket.arn}/*"
        ]
      }
    ]
  })
}