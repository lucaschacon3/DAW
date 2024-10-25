function crearElemento(tipo, contenido, padre) {
  // padre= document.body
  let hijo = document.createElement(tipo);
  hijo.innerHTML = contenido;
  padre.appendChild(hijo);

  hijo.addEventListener(`click`, function () {
    this.remove();
  });
}

let elementosCompra = document.getElementById(`idInputCompra`);
let boton = document.querySelector(`button`);

boton.addEventListener(`click`, function agregarElemento() {
  crearElemento(
    `li`,
    elementosCompra.value,
    document.getElementById(`idElementosCompra`)
  );

  let productos=[]

  document.querySelectorAll(`div`).forEach((e)=>{
    productos.push(e.textContent)
  })

  productos.short

});
