# 🖥️ Módulo de Terraform para Cómputo en AWS
## 📑 Evaluación Parcial 2 - EVP-IaC-II

### 1. 🎯 Objetivos del Repositorio
* **🛠️ Desacoplamiento:** Aislar la lógica de cómputo de la Evaluación Parcial 1 en un componente independiente y reutilizable.
* **📐 Estandarización:** Proveer una estructura de servidores virtuales (EC2) sólida, parametrizada y documentada siguiendo las buenas prácticas de Terraform.
* **🏷️ Versionamiento:** Implementar un flujo de trabajo basado en versionado semántico (`MAJOR.MINOR.PATCH`).

### 2. 🔌 Propósito General del Código
Este módulo está diseñado para automatizar y gestionar la infraestructura de servidores en Amazon Web Services (AWS). Se encarga de la creación y configuración de los siguientes recursos:
* **💻 Instancia EC2 (Amazon Elastic Compute Cloud):** Servidor virtual parametrizado (AMI, tipo de instancia) acoplado a una subred específica.
* **🏷️ Tags de Control:** Asignación dinámica de etiquetas para identificar el entorno, proyecto y herramienta de administración.

---

### 3. 🚀 Instrucciones Básicas de Uso

Para llamar a este módulo desde un código principal (orquestador), se debe utilizar un bloque `module` apuntando a la ruta origen e inyectando obligatoriamente el ID de la subred generada por el módulo de redes:

```hcl
module "computo" {
  source        = "git::[https://github.com/jpinfracloud-DevSecOps/AUY1105-EA2-computo.git?ref=v0.1.0](https://github.com/jpinfracloud-DevSecOps/AUY1105-EA2-computo.git?ref=v0.1.0)"
  subnet_id     = "subnet-XXXXXXXXXXXXXXXXX"
  instance_type = "t2.micro"
  project_name  = "mi-proyecto-ec2"
}
```

### 4. 🗺️ Despliegue Paso a Paso

- Si deseas probar o utilizar este módulo en un entorno de desarrollo local, sigue estas instrucciones detalladas:

1. 👥 Clonar el repositorio:
    Clona este módulo dentro de tu espacio de trabajo local o directorio de proyectos:

    ```bash
    git clone [https://github.com/jpinfracloud-DevSecOps/AUY1105-EA2-computo.git](https://github.com/jpinfracloud-DevSecOps/AUY1105-EA2-computo.git)
    
2. 🔑 Configurar Credenciales de AWS:
Asegúrate de tener configuradas tus credenciales de AWS en tu terminal de Git Bash (vía aws configure o exportando las variables de entorno de AWS Academy/Laboratorio).

    - Option A: Usando Variables de Entorno (Recomendado para laboratorios)
    ```hcl
    export AWS_ACCESS_KEY_ID="TU_ACCESS_KEY_AQUÍ"
    export AWS_SECRET_ACCESS_KEY="TU_SECRET_KEY_AQUÍ"
    export AWS_SESSION_TOKEN="TU_SESSION_TOKEN_AQUÍ"
    ```
    - Option B: Usando el cliente oficial de AWS CLI
     ```hcl
    aws configure
    # Te solicitará el Access Key, Secret Key y la región por defecto (us-east-1)  
    ```
1. 📂 **Navegar al directorio de pruebas:**
Accede a la carpeta de ejemplos configurada para validar el módulo:
    ```hcl
    cd AUY1105-EA2-computo/examples/basic-ec2
    ```
1. ⚙️ **Inicializar Terraform:**
Ejecuta el comando de inicialización para descargar los proveedores necesarios (hashicorp/aws):
    ```hcl
    terraform init
    ```
1. 🔍 **Validar la Sintaxis:**
Comprueba que la configuración no tenga errores de escritura o arquitectura local:
    ```hcl
    terraform validate
    ```
1. 📝 **Generar Plan de Ejecución:**
Visualiza los recursos de red que se crearán en AWS:
    ```hcl
    terraform plan
    ```
1. 🚀 **Aplicar la Infraestructura:**
Despliega los recursos en la nube de AWS (requiere confirmación escribiendo yes):
    ```hcl
    terraform apply
    ```

## 🎯 Filosofía de Diseño y Principios de Arquitectura (Módulo de Cómputo)

Este módulo se ha estructurado bajo una filosofía de ingeniería orientada a la sostenibilidad y el desacoplamiento, basada en tres pilares fundamentales:

1. **Persistencia (Aislamiento y Consistencia):** Rechazamos el desarrollo acelerado. La estabilidad en el cómputo requiere un diseño pausado que permita la validación sintáctica segura mediante entornos de prueba aislados (directorio `examples/`). Al congelar las versiones del proveedor de AWS, garantizamos que el comportamiento del servidor sea consistente y predecible en el tiempo.
   
2. **Escalabilidad (Plasticidad del Hardware):** Las necesidades de cómputo mutan constantemente. Este módulo abstrae el tamaño de la instancia (`instance_type`) y las imágenes de sistema (`ami_id`) en variables dinámicas. Esto permite que la infraestructura se adapte y escale según la demanda del entorno sin necesidad de reescribir el núcleo del código.
   
3. **Reutilización (Arquitectura de Caja Negra):** Este componente funciona de manera agnóstica al entorno. Ha sido diseñado para ser consumido de forma remota por cualquier orquestador, requiriendo únicamente la inyección de una subred (`subnet_id`) para operar, convirtiéndose en un bloque de construcción universal y replicable.    