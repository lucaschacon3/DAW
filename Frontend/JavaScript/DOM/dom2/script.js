crearElemento("li", "Primer elemento", document.body);
crearElemento("li", "Segundo elemento", document.body);


function crearElemento(tipo, contenido, padre) {
  let hijo = document.createElement(tipo);
  hijo.innerHTML = contenido;
  padre.appendChild(hijo);

  hijo.addEventListener("click", function eliminar () {
    this.remove();
  });
}

let boton= document.querySelector("button")

boton.addEventListener("click", function agregarAleatorio() {
  crearElemento("li", `Nuevo elemento: ${Math.random()}`, document.body)
})