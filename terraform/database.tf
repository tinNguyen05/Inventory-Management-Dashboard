resource "aws_db_instance" "postgres" {
  identifier           = "${var.project_name}-db"
  allocated_storage    = 20
  storage_type         = "gp2"
  engine               = "postgres"
  
  engine_version       = "16.6"  

  instance_class       = "db.t3.micro"
  db_name              = "inventorydb"
  username             = var.db_username
  password             = var.db_password
  parameter_group_name = "default.postgres16"
  skip_final_snapshot  = true
  publicly_accessible  = false 
  
  vpc_security_group_ids = [aws_security_group.rds_sg.id]
}