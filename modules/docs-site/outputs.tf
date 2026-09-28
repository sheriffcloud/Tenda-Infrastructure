output "bucket_name" {
  description = "The s3 bucket name"
  value       = aws_s3_bucket.docs.id
}
output "cloudfront_domain" {
  description = "The CloudFront distribution domain name"
  value       = aws_cloudfront_distribution.docs.domain_name
}
output "docs_url" {
  description = "The URL of the docs site"
  value       = "https://${var.subdomain}.${var.domain_name}"
}