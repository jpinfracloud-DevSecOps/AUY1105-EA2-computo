# Changelog

Todos los cambios notables en este proyecto serán documentados en este archivo de acuerdo con los estándares de la evaluación y buenas prácticas de desarrollo.

## [0.1.0] - 2026-05-28

### Añadido
- **Aislamiento de Infraestructura de Cómputo:** Migración y desacoplamiento del servidor virtual EC2 de la Evaluación Parcial 1 hacia un módulo autónomo parametrizado y reutilizable.
- **Componentes de Instancia:** Configuración base en `main.tf` para el aprovisionamiento de la instancia EC2, mapeo de llaves SSH y acoplamiento dinámico a subredes externas.
- **Parametrización:** Inyección de tipos de instancia, identificadores de AMI y tags dinámicos a través de `variables.tf`.
- **Laboratorio de Despliegue Local:** Construcción de la carpeta de ejemplos para simular y validar el ciclo completo de Terraform (`init`, `plan`, `apply`) de forma aislada.

### Security
- Implementación de `.gitignore` para bloquear fugas de llaves privadas (`.pem`) o tokens de sesión temporales de AWS Academy.

## [0.2.0] - 2026-05-28

### Añadido
- 🛡️ **Gobernanza de Presupuesto (OPA):** Creación de la regla `policies/terraform_ec2_check.rego` para restringir el despliegue de hardware solo a instancias económicas autorizadas (`t2.micro`).
- 🚀 **Pipeline de Integración Continua:** Configuración automatizada en `.github/workflows/ci.yml` para ejecutar auditorías secuenciales de formato, sintaxis (`TFLint`), vulnerabilidades (`Checkov`) y cumplimiento de políticas de costos.