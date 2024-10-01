let numero=0

do {
   numero=parseInt(prompt(`Introduce  un numero (mayor que 0 y menor que 10000): `))

} while (numero<=0 || numero>10000);

let esPrimo = numero => {
   let cont=0
   for (let i = 1; i <= numero; i++) {
      if (numero%i===0) {
         cont++
      }
   }
   if (cont==2) {
      return true
   }
   return false
}

if (esPrimo(numero)) {
   console.log(`Es primo`)
}else{
   console.log(`No es primo`)
}

