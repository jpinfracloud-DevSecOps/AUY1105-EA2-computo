# Ejemplo Básico de Uso - Módulo de Cómputo 🖥️

Este directorio contiene un ejemplo para validar de forma local que el módulo de cómputo (instancia EC2) reciba sus variables correctamente y pase los controles de sintaxis.

## Cómo ejecutar este ejemplo

1. Inicializa el directorio de trabajo de Terraform para enlazar el módulo local:
```hcl
terraform init
```
2. Valida que la configuración no tenga errores de sintaxis:
```hcl
terraform validate
```