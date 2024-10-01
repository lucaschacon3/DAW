let numeros=prompt("Introduce 3 numeros separados por comas: ")
let numerosArray=numeros.split(`,`)

let nombre = prompt("Introduce tu nombre: ")
let apellidos = prompt("Introduce tu nombre: ")
let nombreCompleto= `${nombre} ${apellidos}`

let suma=parseInt(numerosArray[0])+parseInt(numerosArray[1])+parseInt(numerosArray[2])
let multiplicacion= parseInt(numerosArray[0])*parseInt(numerosArray[1])*parseInt(numerosArray[2])

console.log(`Tu nombre completo es ${nombreCompleto} \nLa suma es ${suma} \nLa multiplicacion es ${multiplicacion}`)