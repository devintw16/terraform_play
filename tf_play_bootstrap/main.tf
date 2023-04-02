resource "aws_kms_key" "tf_play_key" {
  description             = "tf_play_key"
  deletion_window_in_days = 10
}

resource "aws_s3_bucket" "tf_play_state" {
  bucket = "tfplay.state"

  tags = {
    Name        = "tf_play.state"
    Environment = "Dev"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "tf_play_s3_encryption" {
  bucket = aws_s3_bucket.tf_play_state.id

  rule {
    apply_server_side_encryption_by_default {
      kms_master_key_id = aws_kms_key.tf_play_key.arn
      sse_algorithm     = "aws:kms"
    }
  }
}
