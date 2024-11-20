let ruta = `usuarios.json`;

fetch(ruta)
  .then((response) => {
    if (!response.ok) {
      throw new Error(`Error HTTP ${response.status}`);
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
  //creamos la opcion vacia del select
  let nombreUsuarios = document.getElementById(`idSelect`);
  crearElemento(`option`, `seleccione una opcion`, nombreUsuarios);

  // creamos las opciones del select con los usuarios.json
  data.forEach((e) => {
    crearElemento(`option`, e.nombre, nombreUsuarios);
  });

  //Creamos el evento del select
  nombreUsuarios.addEventListener(`change`, informacionUsuario);
  function informacionUsuario() {
    let informacion = document.getElementById(`idInformacion`);
    informacion.innerHTML = ``;
    data.forEach((e) => {
      let activo = ``;
      if (e.activo) {
        activo = `Activo`;
      } else {
        activo = `No activo`;
      }

      if (nombreUsuarios.value === e.nombre) {
        crearElemento(
          `p`,
          `Nombre: ${e.nombre}, Edad: ${e.edad}, Actividad: ${activo}`,
          informacion
        );
      }

      let losP = document.querySelectorAll(`p`);
      losP.forEach((e) => {
        if (activo === `Activo`) {
          e.classList.add(`verde`);
        } else {
          e.classList.add(`rojo`);
        }
      });
    });
  }

  //creamos el evento del boton
  let cargarUsuarios = document.getElementById(`idBoton`);

  cargarUsuarios.addEventListener(`click`, crearTabla);
  function crearTabla() {
    let tabla = document.getElementById(`idTabla`);
    tabla.innerHTML = ``;
    data.forEach((e) => {
      let activo = ``;
      if (e.activo) {
        activo = `Activo`;
      } else {
        activo = `No activo`;
      }
      crearElemento(
        `tr`,
        `<td>${e.id}</td> <td>${e.nombre}</td> <td>${e.edad}</td> <td>${activo}</td>`,
        tabla
      );

      let losTd = document.querySelectorAll(`td`);
      losTd.forEach((e) => {
        if (activo === `Activo`) {
          e.classList.add(`verde`);
        } else {
          e.classList.add(`rojo`);
        }
      });
    });
  }
}

function crearElemento(tipo, contenido, padre) {
  let hijo = document.createElement(tipo);
  hijo.innerHTML = contenido;
  padre.appendChild(hijo);
}
