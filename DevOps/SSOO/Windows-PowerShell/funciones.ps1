function Calcular {
    param (
        [double]$num1,
        [double]$num2
    )

    Write-Host "Suma: $($num1) + $($num2) = $($num1 + $num2)"
    Write-Host "Resta: $($num1) - $($num2) = $($num1 - $num2 )"
    Write-Host "Multiplicacion: $($num1) * $($num2) = $($num1 * $num2)"
    Write-Host "Division: $($num1) / $($num2) = $($num1 / $num2)"

}

# Ejemplo de uso de la función
$num1 = Read-Host "Ingresa un numero: "
$num2 = Read-Host "Ingresa otro numero: "

(Calcular $num1 $num2)


