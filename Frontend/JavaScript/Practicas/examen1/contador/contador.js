let numero=parseInt(prompt(`Introduce valor inicial para la cuenta regresiva (un número entero positivo) `))

let idSetInterval=setInterval(cuantaRegresiva, 1000)

console.log(`Cuenta regresiva desde ${numero}`)
numeroARestar=numero

function cuantaRegresiva() {

    console.log(numeroARestar)
    numeroARestar--

    if (numeroARestar<0) {
        clearInterval(idSetInterval)
        console.log(`Cuenta terminada`)
        setTimeout(()=>alert(`Hasta otro dia!!!`),2000)
        
    }
    
}
