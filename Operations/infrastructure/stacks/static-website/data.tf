data "aws_route53_zone" "website_zone" {
  name = var.website_domain_name
}