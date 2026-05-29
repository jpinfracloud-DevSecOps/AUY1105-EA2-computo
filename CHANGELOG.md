# Changelog

Todos los cambios notables en este proyecto serán documentados en este archivo de acuerdo con los estándares de la evaluación y buenas prácticas de desarrollo.

## [0.1.0] - 2026-05-28

### Added
- **Aislamiento de Infraestructura de Red:** Migración y desacoplamiento de la VPC de la Evaluación Parcial 1 hacia un módulo autónomo reutilizable.
- **Componentes de Conectividad:** Creación de recursos base en `main.tf` incluyendo `aws_vpc`, `aws_internet_gateway`, `aws_subnet` (pública) y tablas de ruteo con asociación automática de IPs públicas.
- **Parametrización:** Inyección de rangos CIDR y zonas de disponibilidad a través de `variables.tf` para flexibilizar el direccionamiento de red.
- **Laboratorio de Despliegue Local:** Construcción de la carpeta `examples/basic-vpc/` para permitir la simulación y validación del ciclo completo de Terraform (`init`, `validate`, `plan`, `apply`).

### Changed
- **Evolución del README:** Diseño del manual de uso con una estructura por etapas numeradas detallando la inyección de credenciales de AWS Academy de forma limpia.

### Security
- Implementación de `.gitignore` para bloquear fugas de tokens de sesión temporales de AWS en el historial público.
- Congelamiento de versiones de proveedores de Hashicorp mediante firmas hash en el archivo de bloqueo de Terraform.

