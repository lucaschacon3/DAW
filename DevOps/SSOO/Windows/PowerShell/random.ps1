# Generar un número aleatorio entre 0 y 9
$numeroAleatorio = Get-Random -Minimum 0 -Maximum 10

# Mostrar el número aleatorio generado
Write-Host "Numero aleatorio generado: $numeroAleatorio"

# Mostrar encabezado de la tabla de multiplicar
Write-Host "Tabla de multiplicar del numero $numeroAleatorio :"
Write-Host "---------------------------------------------"

# Calcular y mostrar la tabla de multiplicar del número aleatorio
for ($i = 1; $i -le 10; $i++) {
    # Calcular el resultado de la multiplicación
    $resultado = $numeroAleatorio * $i
    # Mostrar la multiplicación en formato "número x i = resultado"
    Write-Host "$numeroAleatorio x $i = $resultado"
}
