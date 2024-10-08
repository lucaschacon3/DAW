let alumnos = new Array();
let nAlumnos = prompt(`Introduce el número de alumnos:`);
let cont=0
do {

    alumnos[cont] = prompt(`Introduce nombre y edad separado por comas`);
    cont++;
} while (cont<nAlumnos);


alumnos.forEach(a=>console.log(`Alumno: ${a} años`))