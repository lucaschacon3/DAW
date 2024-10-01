# Ejemplo de flujo condicional con IF-ELSEIF-ELSE
$cadena = "Hola Mundo"

# Comprobamos si la variable $cadena es igual a "Hola Mundo"
if ($cadena -eq "Hola Mundo") {
    Write-Host "Ha dicho HOLA MUNDO"
}
# Si no, comprobamos si es igual a "Hola"
elseif ($cadena -eq "Hola") {
    Write-Host "Ha dicho Hola"
}
# Si no se cumple ninguna de las condiciones anteriores, ejecutamos este bloque
else {
    Write-Host "NO ha dicho HOLA MUNDO ni Hola"
}

# Calculadora con estructura SWITCH
Write-Host "--------------------"
Write-Host "----CALCULADORA-----"
Write-Host "--------------------"

# Función para mostrar el menú de la calculadora
function MostrarMenu {
    Write-Host "Calculadora"
    Write-Host "-----------"
    Write-Host "1. Suma"
    Write-Host "2. Resta"
    Write-Host "3. Multiplicacion"
    Write-Host "4. Division"
    Write-Host "5. Salir"
}
    
# Mostramos el menú de la calculadora
MostrarMenu

# Solicitamos al usuario que seleccione una opción del menú
$opcion = Read-Host "Seleccione una opcion (1-5)"

# Evaluamos la opción seleccionada utilizando switch
switch ($opcion) {
    "1" {
        # Realizamos la operación de suma
        $num1 = Read-Host "Ingrese el primer numero"
        $num2 = Read-Host "Ingrese el segundo numero"
        Write-Host "Resultado: $( [double]$num1 + [double]$num2)"        
    }
    "2" {
        # Realizamos la operación de resta
        $num1 = Read-Host "Ingrese el primer numero"
        $num2 = Read-Host "Ingrese el segundo numero"
        Write-Host "Resultado: $( [double]$num1 - [double]$num2)" 
    }
    "3" {
        # Realizamos la operación de multiplicación
        $num1 = Read-Host "Ingrese el primer numero"
        $num2 = Read-Host "Ingrese el segundo numero"
        Write-Host "Resultado: $( [double]$num1 * [double]$num2)" 
    }
    "4" {
        # Realizamos la operación de división
        $num1 = Read-Host "Ingrese el primer numero"
        $num2 = Read-Host "Ingrese el segundo numero"
        Write-Host "Resultado: $( [double]$num1 / [double]$num2)" 
    }
    "5" {
        # Salimos de la calculadora
        Write-Host "Saliendo de la calculadora."
    }
    default {
        # En caso de que la opción seleccionada no sea válida
        Write-Host "Opcion no valida. Por favor, seleccione una opcion valida."
    }
}
