let ruta = `productos.json`;
let contElementos = 0;
let importe = 0;

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
  // Crear las opciones del datalist
  let productos = document.getElementById(`productos`);
  data.forEach((e) => {
    crearElemento(`option`, e.producto, productos);
  });

  let listaProductos = document.getElementById(`productoList`);
  let productoInput = document.getElementById(`productoInput`);

  document.body.addEventListener("keydown", anadirLista);

  function anadirLista(event) {
    if (event.key === `Enter`) {
      let encontrado = false;

      // Verificar si el producto ya está en la lista
      let listaExistente = Array.from(listaProductos.querySelectorAll(`li`)).map(
        (li) => li.textContent.split(" - $")[0]
      );

      if (listaExistente.includes(productoInput.value)) {
        alert(`**ERROR** ${productoInput.value} ya está en la lista.`);
        productoInput.value = ""; // Limpiar el input
        return;
      }

      // Comprobar si el producto existe en el archivo JSON
      data.forEach((e) => {
        if (e.producto === productoInput.value) {
          crearElemento(`li`, `${e.producto} - $${e.precio}`, listaProductos);

          encontrado = true;

          // Eliminar elementos con doble clic
          listaProductos.lastChild.addEventListener(`dblclick`, function eliminar() {
            this.remove();
            contElementos--;
            actualizarContadores(-e.precio);
          });

          // Añadir al contador de elementos e importe
          contElementos++;
          actualizarContadores(parseFloat(e.precio));
        }
      });

      // Comprobar si el valor introducido no está en la lista de productos JSON
      if (!encontrado) {
        alert(`**ERROR** ${productoInput.value} no aparece en la lista`);
      }

      // Cambiar de color el último elemento agregado
      let todosLi = listaProductos.querySelectorAll(`li`);
      todosLi.forEach((li) => li.classList.remove(`nuevo-producto-rojo`)); // Resetear colores
      if (listaProductos.lastChild) {
        listaProductos.lastChild.classList.add(`nuevo-producto-rojo`);
      }

      // Limpiar el input después de agregar o alertar
      productoInput.value = "";
    }
  }

  function actualizarContadores(importeCambio) {
    // Actualizar número de elementos
    let idElementos = document.getElementById(`idElementos`);
    idElementos.textContent = contElementos;

    // Actualizar importe total
    let idImporte = document.getElementById(`idImporte`);
    importe += importeCambio;
    idImporte.textContent = `$${importe.toFixed(2)}`;
  }
}

function crearElemento(tipo, contenido, padre) {
  let hijo = document.createElement(tipo);
  hijo.textContent = contenido;
  padre.appendChild(hijo);
}
