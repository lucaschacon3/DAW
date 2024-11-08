const autores = new Map([
  ["Juan Rulfo", ["Pedro Páramo,2024", "El Llano en Llamas,2013"]],
  ["Rosa Montero", ["Cuentos verdaderos,2024"]],
  ["Pablo Neruda", ["Veinte poemas de amor y una canción desesperada,2013", "Antología poética,2014", "Confieso que he vivido,2010"]],
  ["Almudena Grandes", ["La madre de Frankenstein,2020"]],
  ["Miguel de Cervantes Saavedra", ["Don Quijote de la Mancha,1605"]],
  ["Jorge Luis Borges", ["Ficciones,2014", "El sur,1953"]],
  ["Rosa Chacel", ["Memorias de Leticia Valle,1945", "Saturnal,1972"]],
  ["Carmen Laforet", ["La Isla de los Demonios,1952"]]
]);

let selectAutores = document.getElementById("idSelectAutores");
let tbodyAutores = document.getElementById("idTbodyAutores");

// Extraer solo los nombres de autores
let autoresNombre = autores.keys()
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

  autores.forEach((clave, valor) => {

    // Si el autor coincide con el valor seleccionado, añadir la fila
    if (clave === selectAutores.value) {
      let fila = crearElemento("tr", "", tbodyAutores);

      let info= valor.split(`,`)
      crearElemento("td", info[0], fila);
      crearElemento("td", info[1], fila);
    }
  });
}
