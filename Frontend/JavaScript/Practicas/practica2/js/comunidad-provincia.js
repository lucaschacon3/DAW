let provincias = new Map([
  ["Andalucia",["Cádiz", "Córdoba", "Granada", "Sevilla", "Huelva", "Jaen", "Málaga"]],
  ["Madrid", ["Madrid Capital", "Vallecas"]],
  ["Galicia", ["Lugo", "Orense", "Pontevedra"]],
]);


// Atrapamos los select de Autonomía y provincia
let autonomia = document.getElementById("id_autonomia");
let provincia = document.getElementById("id_provincia");


// Creamos el mensaje por defecto en ambas opciones
crearElemento("option", "Seleccione una opción", autonomia);
crearElemento("option", "Seleccione una opción", provincia);


// Deshabilitamos el select de provincia
provincia.setAttribute("disabled", "true");


// Añadimos solo las claves(autonomías) al select de autonomias
let claves_autonomias = new Set(provincias.keys());
function addOpciones() {
  claves_autonomias.forEach((e) => {
    crearElemento("option", e, autonomia);
  });
}
addOpciones();


// funcion para crear elementos
function crearElemento(tipo, contenido, padre) {
  let hijo = document.createElement(tipo);
  hijo.innerHTML = contenido;
  padre.appendChild(hijo);
  return hijo;
}


// creamos el evento al cambiar el select de Autonomía
autonomia.addEventListener("change", anadirDatos);
function anadirDatos() {
  provincia.innerHTML = ""; //limpiamos los datos anteriones del select
  if (autonomia.value != "Seleccione una opción") { // Habilitamos provincia
    provincia.removeAttribute("disabled", "true");
  }

  provincias.forEach((valor, clave) => {
    if (clave === autonomia.value) {
      valor.forEach((e) => {
        crearElemento("option", e, provincia); // creamos los elementos de Autonomía
      });
    }
  });
}


//Creamos el evento del boton para validar los datos
let boton =document.getElementById("id_submit")
boton.addEventListener("click", validarDatos)
function validarDatos() {
    if (!provincias.includes(autonomia.value)) {
        crearElemento("span", "Error al enviar el formulario", document.getElementById("id_form"))

    }
    provincias.forEach((valor, clave=>{
        if(valor.includes(provincia.value)){
            crearElemento("span", "Error al enviar el formulario", document.getElementById("id_form"))
        }
    }))
    e.preventDefault
}