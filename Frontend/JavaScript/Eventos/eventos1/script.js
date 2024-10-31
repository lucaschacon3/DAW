function getAleatorio() {
    return numAleatorio= Math.floor(Math.random()*255)
}

let cuerpo= document.body
cuerpo.addEventListener(`click`, resetearColor)

function resetearColor(evento) { // hay que saber que pulsa el usuario
    if (evento.target.id ===`idCuerpo`) {
        document.body.style.backgroundColor=`white`
    }else if (evento.target.id ===`idBoton`) {
        document.body.style.backgroundColor=`rgb(${getAleatorio()}, ${getAleatorio()}, ${getAleatorio()})`
    }
      
}
