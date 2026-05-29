variable "subnet_id" {
  type        = string
  description = "El ID de la Subnet pública donde se desplegará la instancia EC2 (provisto por el módulo de redes)"
}

variable "instance_type" {
  type        = string
  description = "Tipo de instancia EC2 a utilizar para el despliegue"
  default     = "t2.micro"
}

variable "ami_id" {
  type        = string
  description = "ID de la Amazon Machine Image (AMI) para la instancia"
  default     = "ami-04b70fa74e45c3917" # Ubuntu 24.04 LTS en us-east-1 (puedes cambiarlo según tu laboratorio)
}

variable "project_name" {
  type        = string
  description = "Nombre del proyecto utilizado para la etiqueta 'Name' de los recursos"
  default     = "EVP2-Computo"
}