const letras = [
  "T",
  "R",
  "W",
  "A",
  "G",
  "M",
  "Y",
  "F",
  "P",
  "D",
  "X",
  "B",
  "N",
  "J",
  "Z",
  "S",
  "Q",
  "V",
  "H",
  "L",
  "C",
  "K",
  "E",
];
let numerosDni = new Array();
let cont = 0;

do {
  do {
    numerosDni[cont] = parseInt(
      prompt(`Introduce los numeros del DNI (0-99999999)(salir: -1): `)
    );
  } while (numerosDni[cont] > 99999999 || numerosDni[cont] < -1);

  let posLetra = numerosDni[cont] % 23;
  let dni = `${numerosDni[cont]}${letras[posLetra]}`;
  console.log(`El dni completo es: ${dni}`);
  cont++;
} while (numerosDni[cont - 1] != -1); //es -1 porque sino compara la posicion cont++

console.log(`---HISTORICO---`);
console.log(numerosDni);
