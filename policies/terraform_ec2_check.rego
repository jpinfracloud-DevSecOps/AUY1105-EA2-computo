package terraform.ec2

import future.keywords.in

# Por defecto, asumimos que no hay violaciones
default violation = set()

# Regla que detecta si se usa un tamaño de instancia no permitido
violation[msg] {
    # Busqueda universal y segura dentro de los cambios planificados
    some change in input.resource_changes
    change.type == "aws_instance"
    
    # Interceptamos creaciones o modificaciones activas
    some action in change.change.actions
    action in ["create", "update"]
    
    # Extraemos el tipo de instancia planificado
    instance_type := change.change.after.instance_type
    
    # Si el tipo de instancia NO es t2.micro, se activa la restriccion
    instance_type != "t2.micro"
    
    # Mensaje de error corporativo y parametrizado
    msg := sprintf("POLITICA RECHAZADA: La instancia '%v' esta configurada como '%v'. Solo se permite el tipo 't2.micro' por politicas de la EVA2.", [change.name, instance_type])
}