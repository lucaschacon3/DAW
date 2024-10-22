let boton = document.querySelector("button")
boton.addEventListener("click", agregarCheckbox)

function agregarCheckbox() {

  let numCheckbox = document.getElementById("numero").value
  console.log(numCheckbox)

  for (let i = 0; i < numCheckbox; i++) {

    //document.getElementById("cuerpo")=innerHTML("")
    let checkbox = document.createElement("input")
    checkbox.setAttribute("type", "checkbox")
    //padre.appendChild
    document.getElementById("cuerpo").appendChild(checkbox)


    let label = document.createElement("label")
    label.setAttribute("for", "numero")
    label.innerHTML = ` ${Math.random()} <br>`
    //padre.appendChild
    document.getElementById("cuerpo").appendChild(label)

    label.addEventListener("click", function eliminarElementos() {
      checkbox.remove()
      label.remove()
    })

  }
}

