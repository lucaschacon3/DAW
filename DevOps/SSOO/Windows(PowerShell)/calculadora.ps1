# Función para realizar la suma
function Sumar($num1, $num2) {
    return ([double]$num1 + [double]$num2)
}

# Función para realizar la resta
function Restar($num1, $num2) {
    return ([double]$num1 - [double]$num2)
}

# Función para realizar la multiplicación
function Multiplicar($num1, $num2) {
    return ([double]$num1 * [double]$num2)
}

# Función para realizar la división
function Dividir($num1, $num2) {
    if ($num2 -eq 0) {
        return "Error: No se puede dividir por cero."
    }
    else {
        return ([double]$num1 / [double]$num2)
    }
}

# Función principal de la calculadora
function Calculadora {

    Write-Host "-----------------"    
    Write-Host "-- CALCULADORA --"  
    Write-Host "-----------------"      
    # Mostrar menú
    Write-Host "Seleccione la operacion:"
    Write-Host "1. Suma"
    Write-Host "2. Resta"
    Write-Host "3. Multiplicacion"
    Write-Host "4. Division"
    Write-Host "5. Salir"
        
    # Solicitar opción al usuario
    $opcion = Read-Host "Ingrese el numero correspondiente a la operacion"
        
    # Realizar operación seleccionada
    switch ($opcion) {
        1 {
            $num1 = Read-Host "Ingrese el primer numero"
            $num2 = Read-Host "Ingrese el segundo numero"
            Write-Host "Resultado: $(Sumar $num1 $num2)"
        }
        2 {
            $num1 = Read-Host "Ingrese el primer numero"
            $num2 = Read-Host "Ingrese el segundo numero"
            Write-Host "Resultado: $(Restar $num1 $num2)"
        }
        3 {
            $num1 = Read-Host "Ingrese el primer numero"
            $num2 = Read-Host "Ingrese el segundo numero"
            Write-Host "Resultado: $(Multiplicar $num1 $num2)"
        }
        4 {
            $num1 = Read-Host "Ingrese el primer numero"
            $num2 = Read-Host "Ingrese el segundo numero"
            Write-Host "Resultado: $(Dividir $num1 $num2)"
        }
        5 {
            Write-Host "Saliendo de la calculadora."
            break
        }
        default {
            Write-Host "Opción no valida. Intentelo de nuevo."
        }
    }
    
}

# Llamar a la función principal de la calculadora
Calculadora
