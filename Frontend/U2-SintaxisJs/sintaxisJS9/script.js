
let numeros=prompt(`Introduce los lados del rectangulos separados por (,) (lado,lado): `)
let numero=numeros.split(`,`)


let perimetroRectangulo = (a,b) => {
   return ((2*a)+(2*b))
}

console.log(perimetroRectangulo(parseFloat(numero[0]), parseFloat(numero[1])))

