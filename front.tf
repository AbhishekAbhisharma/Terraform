terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
  required_version = ">= 1.2.0"
}

provider "aws" {
  region  = "ap-south-1"
  profile = "default"  # Assuming you're using the "default" profile
}

resource "aws_cloudfront_distribution" "my_distribution" {
  provider = aws

  origin {
    domain_name = "www.pardhuman.live.s3.us-east-1.amazonaws.com"
    origin_id   = "S3-myOrigin"
  }

  enabled             = true
  default_root_object = "index.html"

  default_cache_behavior {
    target_origin_id = "S3-myOrigin"

    forwarded_values {
      query_string = false

      cookies {
        forward = "none"
      }
    }

    viewer_protocol_policy = "redirect-to-https"
    min_ttl                = 5
    default_ttl            = 200
    max_ttl                = 200

    allowed_methods = ["GET", "HEAD", "OPTIONS", "PUT", "POST", "PATCH", "DELETE"]
    cached_methods  = ["GET", "HEAD"]

    # Example viewer_certificate block
    viewer_certificate {
      cloudfront_default_certificate = true
    }
  }

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  tags = {
    Name = "MyCloudFrontDistribution"
  }
}

