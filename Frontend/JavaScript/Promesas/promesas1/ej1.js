let ruta = "autores.json";

fetch(ruta)
  .then((response) => {
    if (!response.ok) {
      throw new Error(`HTTP error, status = ${response.status}`);
    }
    return response.json();
  })
  .then((data) => {
    main(data);
  })
  .catch((error) => {
    const p = document.createElement("p");
    p.appendChild(document.createTextNode(`Error: ${error.message}`));
    document.body.insertBefore(p, document.body.firstChild); // Si myList no está definido, evitamos el error.
    Swal.fire({
      icon: "error",
      title: "Oops...",
      text: "Something went wrong!",
      footer: '<a href="#">Why do I have this issue?</a>'
    });
  });

function main(autores) {
  let selectAutores = document.getElementById("idSelectAutores");
  let tbodyAutores = document.getElementById("idTbodyAutores");

  if (!selectAutores || !tbodyAutores) {
    console.error("Elementos selectAutores o tbodyAutores no encontrados en el DOM.");
    return;
  }

  // Obtener autores únicos
  let autoresNombre = autores.map((e) => e.Autor); // Usar map en lugar de forEach para simplificar.
  let autoresNoRepetidos = Array.from(new Set(autoresNombre)); // Convertir Set de nuevo en Array.

  // Crear opciones en el select
  autoresNoRepetidos.forEach((autor) => {
    crearElemento("option", autor, selectAutores);
  });

  // Evento para mostrar datos
  selectAutores.addEventListener("change", () => {
    tbodyAutores.innerHTML = ""; // Limpiar la tabla.
    autores.forEach((e) => {
      if (selectAutores.value === e.Autor) {
        let fila = crearElemento("tr", "", tbodyAutores);
        crearElemento("td", e.Titulo, fila);
        crearElemento("td", e.Fecha, fila);
      }
    });
  });
}

// Función para crear elementos dinámicamente
function crearElemento(tipo, contenido, padre) {
  let hijo = document.createElement(tipo);
  hijo.textContent = contenido; // Usar textContent para evitar vulnerabilidades XSS.
  padre.appendChild(hijo);
  return hijo;
}
