let ruta = `productos.json`;

fetch(ruta)
  .then((response) => {
    if (!response.ok) {
      throw new Error(`Error HTTP: ${response.status}`);
    }
    return response.json();
  })
  .then((data) => {
    main(data);
  })
  .catch((error) => {
    alert(`Error: ${error.message}`);
  });

function main(data) {
  // Evento para añadir tabla
  let boton = document.getElementById(`idBoton`);
  boton.addEventListener(`click`, () => anadirTabla(data));

  // Evento para añadir precio según selección
  let selectNombre = document.getElementById(`idSelectNombre`);
  data.forEach((e) => {
    crearElemento(`option`, e.nombre, selectNombre);
  });

  selectNombre.addEventListener(`change`, () => anadirNombre(data, selectNombre));
}

function anadirTabla(data) {
  let tabla = document.getElementById(`idTabla`);
  tabla.innerHTML = ``;

  data.forEach((e) => {
    let fila = document.createElement(`tr`);
    fila.classList.add(e.disponible ? "verde" : "rojo"); // Aplica la clase al <tr>
    fila.innerHTML = `
      <td>${e.id}</td>
      <td>${e.nombre}</td>
      <td>${e.precio}</td>
      <td>${e.stock}</td>
      <td>${e.disponible ? "Disponible" : "No disponible"}</td>
    `;
    tabla.appendChild(fila);
  });
}

function anadirNombre(data, selectNombre) {
  let precio = document.getElementById(`idPrecio`);
  precio.innerHTML = ``;

  const producto = data.find((e) => e.nombre === selectNombre.value);
  if (producto) {
    crearElemento(`p`, `${producto.precio} $`, precio);
  }
}

function crearElemento(tipo, contenido, padre) {
  let hijo = document.createElement(tipo);
  hijo.innerHTML = contenido;
  padre.appendChild(hijo);
}
