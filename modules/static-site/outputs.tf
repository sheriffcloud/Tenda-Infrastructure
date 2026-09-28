output "bucket_name" {
  description = "The name of the S3 bucket"
  value       = aws_s3_bucket.site.id
}
output "cloudfront_domain" {
  description = "The domain name of the CloudFront distribution"
  value       = aws_cloudfront_distribution.site.domain_name
}
output "site_url" {
  description = "The URL of the static site"
  value       = "https://${var.domain_name}"
}

output "cloudfront_certificate_arn" {
  description = "us-east-1 wildcard cert ARN for CloudFront (shared with other subdomain sites)"
  value       = aws_acm_certificate_validation.cloudfront.certificate_arn
}