
# Create an S3 bucket for hosting the website
resource "aws_s3_bucket" "website_bucket" {
  bucket = var.website_domain_name
}



resource "aws_s3_bucket_website_configuration" "this" {
  bucket = aws_s3_bucket.website_bucket.id

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }
}
resource "aws_s3_bucket_public_access_block" "bucket_access_block" {
  bucket = aws_s3_bucket.website_bucket.id

  block_public_acls   = false
  block_public_policy = false
}

resource "aws_s3_bucket_policy" "bucket_policy" {
  bucket = aws_s3_bucket.website_bucket.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect    = "Allow"
        Principal = "*"
        Action = [
          "s3:GetObject"
        ]
        Resource = [
          "${aws_s3_bucket.website_bucket.arn}/*"
        ]
      }
    ]
  })
}



# Create a Route 53 record for the S3 bucket
resource "aws_route53_record" "website_record" {
  zone_id = data.aws_route53_zone.website_zone.zone_id
  name    = var.website_domain_name
  type    = "A"

  alias {
    name                   = aws_s3_bucket.website_bucket.website_domain
    zone_id                = aws_s3_bucket.website_bucket.hosted_zone_id
    evaluate_target_health = false
  }
}
