output "ejemplo_instance_id" {
  value       = module.prueba_computo.instance_id
  description = "Muestra el ID de la instancia desde el entorno de pruebas"
}

output "ejemplo_instance_ip" {
  value       = module.prueba_computo.instance_ip
  description = "Muestra la IP pública de la instancia desde el entorno de pruebas"
}