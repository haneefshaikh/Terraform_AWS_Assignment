#S3 Bucket

resource "aws_s3_bucket" "cloudethix-s3-bucket" {
  bucket = "cloudethix-3tier-arch"

  tags = {
    Name        = "3T-S3"
  }
}

#S3 Public Access Block

resource "aws_s3_bucket_public_access_block" "cloudethix-s3-access" {
  bucket = aws_s3_bucket.cloudethix-s3-bucket.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}


