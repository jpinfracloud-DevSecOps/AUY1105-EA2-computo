provider "aws" {
  region = "us-east-1"
}

# Llamada al módulo de cómputo que está en la raíz (..)
module "prueba_computo" {
  source       = "../../"
  
  # Le pasamos una ID simulada para que pase los checks de validación local
  subnet_id    = "subnet-1234567890abcdef0" 
  project_name = "Prueba-Local-EC2"
}