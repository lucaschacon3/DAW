let deporte= document.getElementById("deporte").value()
let serie= document.getElementById("serie")
let pelicula= document.getElementById("pelicula")

let boton = document.querySelector("button")
boton.addEventListener("click", function addAficiones() {
  let hijo = document.createElement("h4");
  hijo.innerHTML = deporte;
  document.getElementById("eleccionDeporte").appendChild(hijo);
})