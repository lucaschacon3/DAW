# Solicitar una frase al usuario
$frase = Read-Host "Ingrese una frase"

# Invertir la frase utilizando diferentes bucles
Write-Host "Utilizando bucle for:"
$reversedFrase = ""
for ($i = $frase.Length - 1; $i -ge 0; $i--) {
    $reversedFrase += $frase[$i]
}
Write-Host $reversedFrase

Write-Host "Utilizando bucle foreach:"
$reversedFrase = ""
foreach ($char in $frase.ToCharArray()) {
    $reversedFrase = $char + $reversedFrase
}
Write-Host $reversedFrase

Write-Host "Utilizando bucle do-while:"
$reversedFrase = ""
$i = $frase.Length - 1
do {
    $reversedFrase += $frase[$i]
    $i--
} while ($i -ge 0)
Write-Host $reversedFrase

Write-Host "Utilizando bucle do-until:"
$reversedFrase = ""
$i = $frase.Length - 1
do {
    $reversedFrase += $frase[$i]
    $i--
} until ($i -lt 0)
Write-Host $reversedFrase
