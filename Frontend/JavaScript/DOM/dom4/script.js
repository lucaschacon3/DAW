let deporte= document.getElementById("deporte")
let serie= document.getElementById("serie")
let pelicula= document.getElementById("pelicula")

let boton = document.querySelector("button")
boton.addEventListener("click", function addAficiones() {
  
  document.getElementById(`eleccionDeporte`).innerHTML=`${deporte.value}`
  document.getElementById(`eleccionSerie`).innerHTML=`${serie.value}`
  document.getElementById(`eleccionPelicula`).innerHTML=`${pelicula.value}`

  document.getElementById(`eleccionDeporte`).style.color=`blue`
  document.getElementById(`eleccionSerie`).style.color=`blue`
  document.getElementById(`eleccionPelicula`).style.color=`blue`

  document.getElementById(`textoDeporte`).style.color=`green`
  document.getElementById(`textoSerie`).style.color=`green`
  document.getElementById(`textoPelicula`).style.color=`green`

})

