# Objetos

## Objeto Window

```jsx
// Creamos un intervalo que cada 15 segundos ejecuta una funcion (poner sin parentesis) 
let idA=setInterval(nombreFuncion,15000)
// Creamos un timeout que cuando pasen 3 segundos ejecute la funcion
let idB=setTimeout(nombreFuncion,3000)

// Cancelamos el setInterval
clearInterval(idA)
// Cancelamos el timeout
clearTimeout(idB)
```

Con JavaScript es posible abrir una ventana vacía mediante el método open():

```jsx
let nuevaVentana
nuevaVentana = window.open()
nuevaVentana=window.open("http://www.misitioWeb.com/ads”,“Publicidad”, “height=100, width=100”)
```

Para cerrar una ventana se puede invocar el método close():

```jsx
miVentana.document.write(´<input type=button value=Cerrar onclick=window.close()´)
```

## Objeto Array

Es un objeto iterable por posiciones desde [0], aunque se puede recorrer con foreach. No es una colección.

### Declaración Array

```jsx
let a=new Array() // a = []
let b=new Array(2,4,6) // b = [2, 4, 6]

//Pero lo recomendado es crearlos usando notación JSON

let a=[]
let b=[2,4,6]
```

### Uso Array

```jsx
let a=[`Lunes`, `Martes`, 2, 4, 6]
console.log(a.length) // imprime 5

console.log(a[0])// imprime 'Lunes'
console.log(a[4])// imprime 6
a[7]=`Juan` // ahora a=[`Lunes`, `Martes`, 2, 4, 6, , , `Juan`]
console.log(a[7]) // imprime `Juan`
console.log(a[6]) // imprime undefined

a.length=3 // ahora a=['Lunes', 'Martes', 2]

```

### Elementos en Array

```jsx
let a=[`Lunes`, `Martes`, 2, 4, 6];

a.push(`Juan`) // a=[`Lunes`, `Martes`, 2, 4, 6, `Juan`]
a.unshift(7) // a=[7, `Lunes`, `Martes`, 2, 4, 6, `Juan`]
let ultimo=a.pop() // a=[`Lunes`, `Martes`, 2, 4] y ultimo=6
let primero=a.shift() // a=[`Martes`, 2, 4] y primero=`Lunes`
```

### Arrays derivados Array
```jsx
let a=[`Lunes`, `Martes`, 2, 4, 6]

let subArray=a.slice(1, 3) // a=['Lunes', 'Martes', 2, 4, 6]
// subArray=['Martes', 2, 4];
let cadena=a.join('-') // cadena='Lunes-Martes-2-4-6'
```

### Búsqueda y comprobación Array


```jsx
let arrayNotas = [5.2, 3.9, 6, 9.75, 7.5, 3]
arrayNotas.includes(7.5) // true
```

### Ordenación array

```jsx
let a=[`hola`,`adios`,`Bien`,`Mal`,2,5,13,45]
let b=a.sort(); // b=[13, 2, 45, 5, "Bien", "Mal", "adios", "hola"]
```

### Funciones array

```jsx
let array = [`a`, `bb`, `bc`, `d`]
 
array.every( e => e.length == 1 ) // false
array.some( e => e.length == 2 ) // true
let nuevoArr = array.map( e => e.length ) // [1 , 2 , 2 , 1]
let nuevoArr = array.filter( e => e[0] == `b` ) // [bb’,’bc’]
let valor = array.find( e => e[0] == `b`) //’bb
```

### Recorrer array

```jsx
let array = [`a`, `bb`, `bc`, `d`]

for(let i=0; i<tamaño; i++){
	alert(`Elemento.` ${array[i]} `en la posición` ${i})
}

array.forEach((elemento) => console.log(${elemento}))

array.forEach(function(e,i) {
		alert(`Elemento.` ${e} `en la posición` ${i})
		}
 );
```

## Objeto Map

Es una colección que tien clave:valor, donde la clave sólo puede ser texto o números y no se puede repetir.

### Declaración Map

```jsx
let persona = new Map()

persona.set(`nombre`, `Lucas`)
persona.set(`apellido`, `Chacon`)
persona.set(`edad`, 99)

persona.get(`edad`); // 99

persona.size // 3
persona.delete(“edad”)
persona.size // 2
```

### Recorrer Map

```jsx
persona.forEach(function( valor , clave , map ){
	console.log(`valor : ${valor} ,clave : ${clave} ,tamaño: ${map.size}` )
})
```

## Objeto Set

Es una colección que almacena claves, es decir, los elementos no se pueden repetir.

### Declaración y transformación: Set ↔Array

```jsx
//Array con elementos repetidos
let ganadores = [`Márquez`, `Rossi`, `Márquez`, `Lorenzo`, `Rossi`]

let ganadoresNoDuplicados = new Set(ganadores) // {'Márquez, 'Rossi', 'Lorenzo'}

// volvemos a convertirlo en un Array.
let ganadoresNoDuplicados = Array.from(new Set(ganadores)) // ['Márquez, 'Rossi','Lorenzo']
```

### Recorrer Set

Igual que un array normal

```jsx
let array = [`a`, `bb`, `bc`, `d`];

for(let i=0; i<tamaño; i++){
	alert(`Elemento.` ${array[i]} `en la posición` ${i})
}

array.forEach((elemento) => console.log(${elemento}))

array.forEach(function(e,i) {
		alert(`Elemento.` ${e} `en la posición` ${i})
		}
 );
```

## Objeto Number

Es utilizado para valores enteros y decimales.

- NaN → Not a Number

```jsx
let n = 4 // Literal Numérico
let nObj = new Number(4) // Objeto Numérico
Number.MAX_VALUE //Costantes
Number.MIN_VALUE
Number.NaN
//MÉTODOS
Number.isNaN(NaN) //true, es un not a number
Number.isNaN(4) //false, es un número
Number.isInteger(4) //true, Es un entero
Number.isInteger(4.7) //false,Es un decimal
Number.parseInt(`4`) // Pasar a entero la cadena 4’
Number.parseInt(`11101`, 2) // 29, antes se especificó en binario(b=2)
(1234).toString() // “1234”, pasa a cadena el valor numérico.
(1234).toString(2) // “101101”, pasa a binario el valor numérico.
(1.5).toFixed(3) //1.500 , Punto fijo con 3 decimales
(1.5).toExponential(2) // "1.50e+0" en exponencial
(1.5).toFixed(2) // "1.50" en punto fijo
(1.5).toPrecision(1) // "2"
typeof n // number
```

## Objeto Math


```jsx
Math.PI //Constantes

//MÉTODOS
Math.abs(-5) //5,Valor absoluto
Math.max(1,2,3,4) //4, Máximo de la lista
Math.min(1,2,3,4) //1, Mínimo de la lista
Math.pow(x,y) // x^y
Math.sqrt(2) // Raíz cuadrada de 2
Math.floor(4.7) //4, parte entera, con redondeo inferior
Math.ceil(4.7) //5, parte entera, con redondeo superior
Math.round(4.7) //5, parte entera, con redondeo al más cercano
Math.trunc(4.7) //4, devuelve parte entera(truncamiento)
Math.random() // Número al azar entre [0, 1) con 16 decimales
let x = Math.floor(Math.random() * 5) // Número entre 0 y 5.
```

## Objeto String

```jsx
let s = `cadena`; // Literal Cadena
let sObj = new String(`cadena`) // Objeto String
// PROPIEDADES
s.length // 6, número de carścteres
`Hola`.lenght // 4, número de carácteres
s [0] //c,primer caracter
// MÉTODOS
s.charAt(1) // c, carácter en la posición 1
s.indexOf(`den`) // 3, posición 1ª ocurrencia cadena ‘den’, -1 no encontrado
s.concat(`33`,`44`) // cadena3344, concatena todas las cadenas
`Manz`.concat(`i`, `to`) // 'Manzito'
`Manz`.includes(`an`) // true ('Manz' incluye 'an')
`Hola a todos`.search(/o/g) // busca globalmente las "o", 1, devuelve posición de la 1ª o
`Hola a todos`.match(/o/g) // ['o', 'o', 'o'], las 3 "o" que encuentra
`Na`.repeat(5) // 'NaNaNaNaNa'
`MANZ`.toLowerCase // 'manz'
`manz`.toUpperCase() // 'MANZ'
` Hola `.trim() // 'Hola'
`Amigo`.replace(`A`, `Ene`) // 'Enemigo'
`Dispara`.replace(`a`, `i`) // 'Dispira' (sólo reemplaza la primera aparición)
`Dispara`.replace(/a/g, `i`) // 'Dispiri' (reemplaza todas las ocurrencias)
`Submarino`.substr(3) // 'marino' (desde el 3 en adelante)
`Submarino`.substr(3, 1) // 'm' (desde el 3, hasta el 3+1)
(1:2:3:4).split(‘:’) // Separamos por “,” [1,2,3,4]
`Código`.split(``) // ['C', 'ó', 'd', 'i', 'g', 'o'] (6 elementos)
`5`.padStart(6, `0`) // '000005'
`A`.padEnd(5, `·`) // 'A····'
const sujeto = `frase`
const adjetivo = `concatenada`
`Una ` + sujeto + ` bien ` + adjetivo; // Concatenación antigua
`Una ${sujeto} mejor ${adjetivo}` // Concatenación actual
```