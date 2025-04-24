output "static_website_endpoint" {
  description = "This gives us the endpoint of s3 static website"
  value       = aws_s3_bucket_website_configuration.static_website_config.website_endpoint
}