let ruta = `articulos.json`;

fetch(ruta)
  .then((response) => {
    if (!response.ok) {
      throw new Error(`HTTP error, stattus ${response.status}`);
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
  let select = document.getElementById(`idSelect`);
  crearElemento(`option`, `Seleccione producto`, select);
  data.forEach((e) => {
    crearElemento(`option`, `${e.nombre}`, select);
  });
  let precio = document.getElementById(`idPrecio`);

  select.addEventListener(`change`, actualizaPrecio);
  function actualizaPrecio() {

    precio.innerHTML = ``;
    data.forEach((e) => {
      if (select.value === e.nombre) {
        crearElemento(`p`, `El precio es ${e.precio}`, precio);
      }
    });

    let losP = document.querySelectorAll(`p`);
    losP.forEach((e) => {
      e.classList.add('rojo');
    });
  }
}

function crearElemento(tipo, contenido, padre) {
  let hijo = document.createElement(tipo);
  hijo.innerHTML = contenido;
  padre.appendChild(hijo);
}
