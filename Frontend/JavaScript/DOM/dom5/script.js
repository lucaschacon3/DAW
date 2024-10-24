
function crearElemento(tipo, contenido, padre) {// padre= document.body
  let hijo = document.createElement(tipo);
  hijo.innerHTML = contenido;
  padre.appendChild(hijo);

  hijo.addEventListener(`click`, function eliminar () { 
    this.remove();
  });
}

let elementoCompra=document.getElementById(`idInputCompra`)

let boton= document.querySelector(`button`)

boton.addEventListener(`click`, function eliminar () { 
  crearElemento(`li`,elementoCompra.value, document.getElementById(`idElementosCompra`))

})