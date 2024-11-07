const autores = [
  new Set(["Juan Rulfo", "Pedro Páramo", "2014"]),
  new Set(["Juan Rulfo", "El Llano en Llamas", "2013"]),
  new Set(["Rosa Montero", "Cuentos verdaderos", "2024"]),
  new Set(["Pablo Neruda","Veinte poemas de amor y una canción desesperada","2013",]),
  new Set(["Almudena Grandes", "La madre de Frankenstein", "2020"]),
  new Set(["Miguel de Cervantes Saavedra", "Don Quijote de la Mancha", "1605"]),
  new Set(["Jorge Luis Borges", "Ficciones", "2014"]),
  new Set(["Rosa Chacel", "Memorias de Leticia Valle", "1945"]),
  new Set(["Pablo Neruda", "Antología poética", "2014"]),
  new Set(["Rosa Chacel", "Saturnal", "1972"]),
  new Set(["Carmen Laforet", "La Isla de los Demonios", "1952"]),
  new Set(["Jorge Luis Borges", "El sur", "1953"]),
  new Set(["Pablo Neruda", "Confieso que he vivido", "2010"]),
];

let selectAutores = document.getElementById("idSelectAutores");
let tbodyAutores = document.getElementById("idTbodyAutores");

// Extraer solo los nombres de autores
let autoresNombre = autores.map((e) => Array.from(e)[0]);
let autoresNoRepetidos = new Set(autoresNombre);

haceroption();
function haceroption() {
  autoresNoRepetidos.forEach((autor) => {
    crearElemento("option", autor, selectAutores);
  });
}

function crearElemento(tipo, contenido, padre) {
  let hijo = document.createElement(tipo);
  hijo.innerHTML = contenido;
  padre.appendChild(hijo);
  return hijo;
}


selectAutores.addEventListener("change", anadirDatos);
function anadirDatos() {
  tbodyAutores.innerHTML = "";

  autores.forEach((e) => {
    const [autor, titulo, ano] = Array.from(e); // Convertir el Set a un array

    // Si el autor coincide con el valor seleccionado, añadir la fila
    if (autor === selectAutores.value) {
      let fila = crearElemento("tr", "", tbodyAutores);
      crearElemento("td", titulo, fila);
      crearElemento("td", ano, fila);
    }
  });
}
