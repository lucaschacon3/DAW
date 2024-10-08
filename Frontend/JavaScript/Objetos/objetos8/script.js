let socios = new Map();

let nAlumnos = prompt(`Introduce el número de alumnos:`);
let cont = 0;

do {
  let nombre = prompt(`Introduce el nombre`);
  let edad = prompt(`Introduce la edad`);

  socios.set(nombre, edad);
  cont++;
} while (cont < nAlumnos);

socios.forEach((s) => console.log(`${s}`));

function borrarNombre() {
  let nombreBorrar = prompt(`Introduce el nombre a borrar: `);
  socios.delete(nombreBorrar);
  alert(`Socio borrado`);
}

