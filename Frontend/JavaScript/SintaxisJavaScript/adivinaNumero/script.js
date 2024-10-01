const max = 10;
let numAleatorio = Math.floor(Math.random() * max);
let numUsuario = new Array();
let cont = 0;
let salir = false;

do {
  numUsuario[cont] = parseInt(prompt(`Introduce un numero entre 0 y 10: `));

  if (numUsuario[cont] === numAleatorio) {
    console.log(`Has adivinado el numero`);
  } else if (isNaN(numUsuario[cont])) {
    console.log(`Has salido`);
    numUsuario[cont] = numAleatorio;
  } else {
    if (numAleatorio > numUsuario[cont]) {
      console.log(`El numero a adivinar es mayor`);
      cont++;
    } else {
      console.log(`El numero a adivinar es menor`);
      cont++;
    }
  }
} while (numUsuario[cont] != numAleatorio);

console.log(`----INTENTOS----`);
for (let i = 0; i < numUsuario.length; i++) {
  console.log(`Intento ${i + 1}: ${numUsuario[i]}`);
}
console.log(`historial : ${numUsuario}`);
