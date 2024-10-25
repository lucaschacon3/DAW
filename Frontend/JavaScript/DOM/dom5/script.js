function crearElemento(tipo, contenido, padre) {
  // padre= document.body
  let hijo = document.createElement(tipo);
  hijo.innerHTML = contenido;
  padre.appendChild(hijo);

  //hijo.addEventListener(`click`, function () {
    //this.remove();
  //});
}

let elementosCompra = document.getElementById(`idInputCompra`);
let boton = document.querySelector(`button`);
let productos=[]

boton.addEventListener(`click`, function agregarElemento() {
  crearElemento(
    `li`,
    elementosCompra.value,
    document.getElementById(`idDivCompra`) //padre
  );


  productos.push(document.getElementById(`idInputCompra`).value)
  console.log(productos)

  document.querySelectorAll(`#idDivCompra`)


  elementosCompra.value=` `
});
