let minutos=0;
let segundos=10

let reloj=()=>{
    console.log(`tiempo restante: ${minutos}:${segundos}`)
    segundos--
    if (segundos===0) {
        console.log(`Tiempo acabado`)
        clearInterval(id)
    }
}

var id= setInterval(reloj,1000)