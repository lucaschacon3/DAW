let calificaciones=prompt(`Dame las notas separadas por ;`)

let calificacion= calificaciones.split(`;`)

for (let i = 0; i < calificacion.length; i++) {
    if (parseInt(calificacion[i])>=0 && parseInt(calificacion[i])<3) {
        console.log(`La nota ${i+1} es muy deficiente`)
    }
    
    if (parseInt(calificacion[i])>=3 && parseInt(calificacion[i])<5) {
        console.log(`La nota ${i+1} es insuficiente`)
    }

    if (parseInt(calificacion[i])>=5 && parseInt(calificacion[i])<6) {
        console.log(`La nota ${i+1} es bien`)
    }

    if (parseInt(calificacion[i])>=6 && parseInt(calificacion[i])<9) {
        console.log(`La nota ${i+1} es notable`)
    }

    if (parseInt(calificacion[i])>=9 && parseInt(calificacion[i])<=10) {
        console.log(`La nota n ${i+1} es sobresaliente`)
    }
}