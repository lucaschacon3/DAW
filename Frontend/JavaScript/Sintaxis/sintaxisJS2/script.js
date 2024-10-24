let numeros=prompt("Introduce 3 numeros separados por comas: ")
let numerosArray=numeros.split(`,`)
let num1=parseInt(numerosArray[0])
let num2=parseInt(numerosArray[1])
let num3=parseInt(numerosArray[2])


let mensaje=` `

if(num1>=10){
    mensaje= `${mensaje} el 1º numero es mayor o igual de 10\n`
}
if(num2>=10){
    mensaje= `${mensaje} el 2º numero es mayor o igual de 10\n`
}
if(num3>=10){
    mensaje= `${mensaje} el 3º numero es mayor o igual de 10\n`
}
if(num1<10 && num2<10 && num3<10){
    mensaje= `Ninguno de los 3 numeros es mayor que 10`
}

console.log(mensaje)