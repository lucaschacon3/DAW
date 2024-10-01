let anyo=parseInt(prompt(`Introduce  un año: `))

let esBisiesto = anyo => (anyo%4===0); 

if (esBisiesto(anyo)) {
   console.log(`Es bisiesto`)
}else{
   console.log(`No es bisiesto`)
}

