var array1 = [1, 2, 3, 4, 5, 6, 7, 8, 1];
var array2 = [1, 2, 3, 4, 5, 6, 7, 8, 1];


/*1. Vamos a crear un array que almacene 10 múltiplos de 5 aleatorios entre 0 y 100,
además debe cumplir que el primer elemento no sea menor de 50 y el último no sea
mayor de 50. Para ello seguiremos los siguientes pasos:
· Crea un array de 10 elementos.
· Inicializa el array con múltiplos aleatorios de 5
· Si el primer elemento es menor de 50, lo eliminamos e insertamos otro múltiplo
aleatorio de 5. Esta operación se realizará hasta que el primer elemento sea
mayor o igual que 50
· Si el último elemento es mayor de 50, lo eliminamos e insertamos otro múltiplo
de 5 aleatorio. Esta operación se realizará hasta que el último elemento sea
menor o igual que 50
· Mostraremos el contenido del array en pantalla.
*/
var arrayMultiplos = new Array(10);
for (let i = 0; i < arrayMultiplos.length; i++) {
    numAleatorio1=(Math.floor(Math.random()*10))*5;
    arrayMultiplos[i]= numAleatorio1;
    
}
while (arrayMultiplos[10]>50) {
    numAleatorio1=(Math.floor(Math.random()*10))*5;
    arrayMultiplos[i]= numAleatorio1;
}
document.write("Numeros aleatorios multiplos de 5: "+arrayMultiplos + "<br>");
document.write("<br>");



/*2. Escribe una función de Javascript que compruebe si dos arrays contienen los mismos
elementos. */
document.write("Array 1: "+ array1+ "<br>");
document.write("Array 2: "+ array2+ "<br>");
if (CombruebaArraysIguales(array1, array2)) {
   
    document.write("Son iguales <br>");
} else {
    document.write("Son diferentes <br>");
}
document.write("<br>");
Combruebarepetidos(array1);


function CombruebaArraysIguales(array1, array2) {
    contadorPalabrasIguales = 0
    for (let i = 0; i < array1.length; i++) {
        if (array1[i] == array2[i]) {
            contadorPalabrasIguales++;
        }

    }
    if (contadorPalabrasIguales == array1.length) {
        return true;
    }
    return false;
}
document.write("<br>");

/* 3. Escribe una función de Javascript que detecte cuántos elementos repetidos hay en un array
y además indique en qué posición están.*/

function Combruebarepetidos(array1) {
    contadorPalabrasRepetidas = 0
    for (let i = 0; i < array1.length; i++) {
        for (let j = i + 1; j < array1.length; j++) {
            if (array1[i] == array1[j]) {
                contadorPalabrasRepetidas++;


            }

        }

    }
    document.write("Se repiten " + contadorPalabrasRepetidas + " numeros <br>");
}
document.write("<br>");

/*4. Crea un array de números aleatorios, ordénalos y muéstralos en una lista desordenada.*/

arrayAleatorios = new Array(10);
for (let i = 0; i < arrayAleatorios.length; i++) {
    numAleatorio2 = Math.floor(Math.random() * 10);
    arrayAleatorios[i] = numAleatorio2;

}
document.write("Numeros desordenados: " + arrayAleatorios + "<br>")

for (var i = 0; i < arrayAleatorios.length - 1; i++) {
    for (var j = 0; j < arrayAleatorios.length - 1; j++) {
        if (arrayAleatorios[j] > arrayAleatorios[j + 1]) {
            var temporal = arrayAleatorios[j];
            arrayAleatorios[j] = arrayAleatorios[j + 1];
            arrayAleatorios[j + 1] = temporal;
        }
    }
}

document.write("Numeros ordenados: " + arrayAleatorios + "<br>")
document.write("<br>");

/*5. Crea una función que devuelva el último elemento de un array*/

function UltimoElemento(array1) {

    return array1[array1.length - 1];
}

document.write("El ultimo elemento del array 1 es: " + UltimoElemento(array1) + "<br>");