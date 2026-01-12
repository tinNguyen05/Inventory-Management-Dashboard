resource "random_id" "bucket_suffix" {
  byte_length = 4
}

resource "aws_s3_bucket" "inventory_images" {
  bucket = "${var.project_name}-assets-${random_id.bucket_suffix.hex}"
  
  tags = {
    Name = "Inventory Assets"
  }
}