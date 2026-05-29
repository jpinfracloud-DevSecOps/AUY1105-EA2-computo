resource "aws_instance" "servidor" {
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = var.subnet_id

  tags = {
    Name        = "${var.project_name}-instance"
    Environment = "Dev"
    ManagedBy   = "Terraform"
  }
} 