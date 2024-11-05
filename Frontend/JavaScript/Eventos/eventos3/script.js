let caja = document.getElementById('idCaja')
let cuerpo = document.body

let x=0
let y=0

cuerpo.addEventListener(`keydown`, moverCuadrado)

function moverCuadrado(e) {
    if (e.key==`ArrowUp`|| e.key==8) {
        y=y-10
    }

    if (e.key==`ArrowDown`|| e.key==2) {
        y=y+10
    }

    if (e.key==`ArrowLeft`|| e.key==4) {
        x=x-10
    }

    if (e.key==`ArrowRight`|| e.key==6) {
        x=x+10
    }

    caja.setAttribute(`style`, `left: ${x}px; top: ${y}px;`)
}

