output "instance_id" {
  value       = aws_instance.servidor.id
  description = "El ID único de la instancia EC2 creada en AWS"
}

output "instance_ip" {
  value       = aws_instance.servidor.public_ip
  description = "La dirección IP pública asignada a la instancia EC2"
}