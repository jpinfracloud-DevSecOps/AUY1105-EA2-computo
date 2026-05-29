# Changelog

Todos los cambios notables en este proyecto serán documentados en este archivo de acuerdo con los estándares de la evaluación.

## [0.1.0] - 2026-05-28

### Added
- Estructura base del módulo de cómputo (`main.tf`, `variables.tf`, `outputs.tf`, `versions.tf`).
- Configuración del archivo `.gitignore` para excluir archivos temporales de Terraform y secretos.
- Entorno de pruebas local en la ruta `examples/basic-ec2/` para validación de sintaxis.
- Parametrización de variables críticas (`subnet_id`, `instance_type`, `ami_id`, `project_name`).
- Outputs requeridos por la pauta (`instance_id`, `instance_ip`).