output "ec2_public_ip" {
  description = "Public IP of the Backend Server"
  value       = aws_instance.app_server.public_ip
}

output "rds_endpoint" {
  description = "Database Connection Endpoint"
  value       = aws_db_instance.postgres.endpoint
}

output "s3_bucket_name" {
  description = "S3 Bucket Name"
  value       = aws_s3_bucket.inventory_images.bucket
}

output "ssh_command" {
  description = "Command to SSH into EC2"
  value       = "ssh -i inventory-key.pem ubuntu@${aws_instance.app_server.public_ip}"
}