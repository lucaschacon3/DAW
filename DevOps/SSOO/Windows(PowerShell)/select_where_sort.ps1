# Definimos una lista de coches como objetos PowerShell
$coches = @(
    [PSCustomObject]@{
        Marca = "Toyota"
        Modelo = "Corolla"
        Año = 2018
        Precio = 15000
    },
    [PSCustomObject]@{
        Marca = "Honda"
        Modelo = "Civic"
        Año = 2019
        Precio = 17000
    },
    [PSCustomObject]@{
        Marca = "Ford"
        Modelo = "Fiesta"
        Año = 2016
        Precio = 12000
    },
    [PSCustomObject]@{
        Marca = "Toyota"
        Modelo = "Camry"
        Año = 2020
        Precio = 20000
    }
)

# Utilizamos Where para filtrar los coches de la marca "Toyota"
Write-Host "Coches de la marca Toyota:"
$cochesToyota = $coches | Where-Object { $_.Marca -eq "Toyota" }
$cochesToyota

# Utilizamos Select para mostrar solo la marca y el modelo de los coches
Write-Host "Marca y modelo de todos los coches:"
$coches | Select Marca, Modelo

# Utilizamos Sort para ordenar los coches por año de forma descendente
Write-Host "Coches ordenados por año de forma descendente:"
$coches | Sort-Object Año -Descending
