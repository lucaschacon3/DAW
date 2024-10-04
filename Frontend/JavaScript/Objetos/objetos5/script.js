let nNombres= 0
let nombres=new Array()
do {
    nombres[nNombres]= prompt(`Introduce nombre para la persona ${nNombres+1}`)
    nNombres++
    if (nombres[nNombres]===null) {
        nNombres--
    }
} while (nNombres!=3);

nombres.forEach(e=>console.log(`Nombre de socio: ${e}`))
console.log(`Numero de socios: ${nNombres}`)
nombres.sort()
console.log(`Nombre de socios ordenados: ${nombres}`)
nombres.reverse()
console.log(`Nombre de socios ordenados inversos: ${nombres}`)
