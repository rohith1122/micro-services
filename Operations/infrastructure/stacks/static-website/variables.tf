variable "aws_profile" {
  description = "Texas AWS profile name"
  default     = "ts"
  type        = string
}

variable "aws_region" {
  description = "Triangle Soft AWS region"
  default     = "eu-west-2"
  type        = string
}
variable "terraform_state_bucket_name" {
  description = "Name of the S3 bucket for Terraform state"
  default     = "triangle-soft-terraform-state-bucket"
  type        = string

}
variable "website_domain_name" {
  description = "Name of the S3 bucket for the website"
  default     = "triangle-soft.com"
  type        = string

}