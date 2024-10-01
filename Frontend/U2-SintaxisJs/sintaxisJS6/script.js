let numeros=prompt(`Dame numeros separados por (,)`)
let numero= numeros.split(`,`)

if (hay10(numero)) {
    console.log(`En la secuencia hay un 10`)
}else{
    console.log(`En la secuencia no hay un 10`)
}


function hay10 (numero){
    for (let i = 0; i < numero.length; i++) {
        if (parseInt(numero[i])===10) {
            return true
        }
        
    }
    return false
}