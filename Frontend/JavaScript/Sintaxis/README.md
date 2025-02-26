**Comentarios → //**  

Al emparejar el html con el JavaScript usar **DEFER** para que no haya problemas de ejecución del script

```html
<script src="script.js" defer></script>
```

### PopUps JavaScript

```jsx
alert(”Hola”); // Mensaje en forma de pop-up.
let variable=prompt(”Introduce un nombre”); //Se guarda un string.
let variable =confirm(`¿Eres alto?`); //Se guarda true o false.
document.write(”hola”); // No es recomendable porque modifica el html.
```

### Variables

La forma de llamarlas es “camelCase” y hay que usar let o const, nunca “var”.

```jsx
let num=`100`; // Es una cadena 
let num3=11; // Es un number
let n=parseInt(num); // Castea a number
let n2=parseFloat(num); // Casteo a float
let n3=num3.toString(); // Casteo de number a string
let esPrimo=true
let miVector=new Array();
miVector[0]=22;
let otroArray=[1,2,`Cancamusa`];
```

### Concatenar con Template Literals

Lo ideal es no hacerlo con el +, por lo que usar las comillas Template Literals para todo. 

- let cad= ``El usuario tiene: ${edad} años` `
    - usar las comillas (``) en la tecla “[”, si usamos solo esas mejor.

### Operadores

- +, -, *, /, %(mod)
- === (para comparar usar el triple porque el doble da problemas, el triple compara hasta el tipo).
- ! = (distinto de).
- >, <, > =, < =
- &&, ||, !(para valores booleanos).

### Estructuras de control (bucles y condicionales)

No usar break o continue, usar booleanos o funciones.

- if - else
- if - else if - else
- for
- foreach
    
    ```jsx
    array.forEach((elemento) => console.log(${elemento}));
    
    array.forEach(function(e,i) {
    		alert(`Elemento.` ${e} `en la posición` ${i});
    		}
     );
    ```
    
- while
- do - while
- switch

### Funciones

- Funciones estandar con parametros.
    
    ```jsx
    function nombrefuncion (parámetro1, parámetro2){
        return parametro1+parametro2;
    }
    ```
    
- Funciones estandar sin parametros.
    
    ```jsx
    function nombrefuncion (){
    		let num = 2*2;
        return num;
    }
    ```
    
- Funciones anonimas.
    
    ```jsx
    var suma = function (a,b){
         return a+b;
    }
    ```
    
- Funcion flecha
    
    ```jsx
    var suma = (a,b) => {return a+ b}
    ```
    
    ```jsx
    var suma = (a,b) => a+ b
    ```
    

Si queremos ejecutar un funcion al ejecutar el JavaScript:

```jsx
this.onload = function() { //cuando se carge la pagina (si el elemento que se usa en JS no se ha cargado en el HTML)
	Iniciar();
	numeroAdivinar = Math.floor(Math.random() *100); // multiplicarlo por el numero hasta el que queremos.
}
```