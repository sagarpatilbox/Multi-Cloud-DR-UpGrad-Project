variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "project_name" {
  description = "Project name prefix"
  type        = string
  default     = "multi-cloud-dr"
}

variable "public_key_path" {
  description = "Path to your SSH public key"
  type        = string
}
