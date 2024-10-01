#ejercicio 1
#para ver las funciones que podemos utilizar usamos: ($prueba) | get-member
"---------------------------"
Write-Host "Introduce una cadena" # con Write-Host imprimimos en la consola
$prueba= Read-Host # con Read-Host leemos por teclado

Write-Host "---------------------------"
Write-Host "La cadena tine las siguentes caracteristicas:"
Write-Host "---------------------------"

if (($prueba).Contains('a')) { # si prueba contine la a = True (devuelve un boleano)
    Write-Host "La cadena contiene la letra 'a'"
}else {
    Write-Host "La cadena no contiene la letra 'a'"
}

if (($prueba).Equals("Hola mundo")) { # si prueba es igual a 'Hola mundo' = True (devuelve un boleano) 
    Write-Host "La cadena es 'Hola mundo'"
}else {
    Write-Host "La cadena es no es 'Hola mundo' es: "+$prueba
}

if (($prueba).Length -gt 7) { # si prueba es mayor a 7 = True (devuelve un boleano)(compara dos enteros)
    Write-Host "La cadena tiene mas de 7 caracteres"
}else{
    Write-Host "La cadena tiene menos de 7 caracteres"
}
Write-Host "---------------------------"
Write-Host "Introduce un numero"

[int]$prueba2= Read-Host

Write-Host "---------------------------"
Write-Host "El numero tine las siguentes caracteristicas:"
Write-Host "---------------------------"


if (($prueba2).CompareTo(10) -eq 1) { # si prueba2 es mayor que 10 = devuelve 1)
    Write-Host "El numero es mayor a 10"
}elseif(($prueba2).CompareTo(10) -eq -1){ # si prueba2 es menor que 10 = devuelve -1)
    Write-Host "El numero es menor a 10"
}elseif (($prueba2).CompareTo(10) -eq 0) { # si prueba2 es igual que 10 = devuelve 0)
    Write-Host "El numero es 10"
}

Write-Host "El numero elegido + 10 es:"+ (($prueba2)+10)

Write-Host "---------------------------"
Write-Host "Comillas dobles y simple en Write-Host:"
Write-Host "---------------------------"

$nombre = "Juan"
Write-Host "Hola, $nombre"   # Esto imprimirá: Hola, Juan

$nombre = "Juan"
Write-Host 'Hola, $nombre'   # Esto imprimirá: Hola, $nombre



