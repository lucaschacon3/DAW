let nombres = new Array();
let edades = new Array();
let nAlumnos = prompt(`Introduce el número de alumnos:`);
let cont = 0;
do {
  nombres[cont] = prompt(`Introduce el nombre`);
  edades[cont] = prompt(`Introduce la edad`);
  cont++;
} while (cont < nAlumnos);

for (let i = 0; i < nombres.length; i++) {
  console.log(`Nombre: ${nombres[i]} Edad: ${edades[i]}`);
}

function borrarNombre() {
  let nombreBorrar = prompt(`Introduce el nombre a borrar: `);
  for (let i = 0; i < nombres.length; i++) {
    if (nombres[i] === nombreBorrar) {
        nombres.splice(i,1);
        edades.splice(i,1);;
      alert(`Socio borrado`)
    }
  }

}

function borrarIndice() {
  let indiceBorrar = prompt(`Introduce el indice a borrar: `);

  nombres.splice(indiceBorrar,1);
  edades.splice(indiceBorrar,1);
  alert(`Socio borrado`)

}
