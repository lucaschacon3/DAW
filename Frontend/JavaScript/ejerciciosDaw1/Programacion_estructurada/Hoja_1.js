//completa los if
function ejercicio3() {
    var numero1 = 7;
    var numero2 = 9;

    if (numero1 <= numero2) {
        document.write("numero1 no es mayor que numero2");
    }
    if (numero2 > 0) {
        document.write("numero2 es positivo");
    }
    if (numero1 < 0 || numero1 != 0) {
        document.write("numero1 es negativo o distinto de cero");
    }
    if (!(numero1 + 1 >= numero2)) {
        document.write("Incrementar en 1 unidad el valor de numero1 no lo hace mayor o igual que numero2");
    }

};

//escribe por pantalla los di­as de la semana en una lista ordenada 
function ejercicio4_2() {
    var dias = ["Lunes", "Martes", "Miercoles", "Jueves", "Viernes", "Sabado", "Domingo"];
    document.write("<ol>");
    for (i = 0; i < dias.length; i++) {
        document.write("<li>" + dias[i] + "</li>");
    }
    document.write("</ol>");
};
//escribe por pantalla los primeros 10 numeros
function ejercicio5_1() {
    for (i = 1; i < 11; i++) {
        document.write(i + " ");
    }
};
//escribe por pantalla los primeros 20 pares separados con espacio
function ejercicio5_2() {
    let tot = 1;//con tot llevaremos el contador para mostrar solo 20 numeros pares
    let i = 0;
    while (tot < 20) {
        if (i % 2 == 0) {
            document.write(i + " ");
            tot++;
        }
        i++;
    }
};
//escribir numeros divisibles por 7 y menores que 500
function ejercicio5_3() {
    let i = 0;
    while (i < 500) {
        if (i % 7 == 0) {
            document.write(i + " ");
        }
        i++;
    }
};
//Pide al usuario un numero, le indicara si es par o impar y se controla que realmente se ha introducido un numero
function ejercicio6() {
    let num = prompt("Introduce un numero");

    if (num.length > 0 && +(num) == num) {

        if (num % 2 == 0) {
            alert("El numero es par");
        }
        else {
            alert("El numero es impar");
        }

    }
    else {
        alert("No has introducido ningun numero")
    }
};
//lanzar dos dados y mostrar el resultado
function ejercicio7() {
    let dado1 = Math.floor(Math.random() * 6 + 1);
    document.write("<p>Tirada dado1:" + dado1 + "</p>");
    let dado2 = Math.floor(Math.random() * 6 + 1);
    document.write("<p>Tirada dado1:" + dado2 + "</p>");
}
function ejercicio8() {
    for (i = 0; i < 6; i++) {
        var num = Math.floor(Math.random() * 49 + 1);
        document.write(" <b>Numero " + (i + 1) + ":</b> " + num);
    }
};
function ejercicio9() {
    for (i = 0; i < 14; i++) {
        var num = Math.floor(Math.random() * 3 + 1);
        signo = num;
        if (num == 3) {
            signo = "X";
        }
        document.write(signo + "<br/>");
    }
    var P1=Math.floor(Math.random() * 4);
    var P2=Math.floor(Math.random() * 4);
    if(P1==3)
    {
        P1="M";
    }
    if(P2==3)
    {
        P2="M";
    }
    document.write("Partido 15: "+P1+"-"+P2);
};
function ejercicio10(){
    do
    {
        num=Math.floor(Math.random()*1000+1);
        document.write(num+"<br/>");
    }
    while(num!=666)
    document.write("Encontrado!!!!");
    
};

/* Aprendizaje:
    Para escribir en el html -> document.write("Hola");
    Mensaje emergente -> alert("Alerta");
    Scanner -> prompt("Introduce un numero");

    Dado_random-> Math.floor(Math.random() * 6 + 1);
    Array de String -> var array = ["", "", "", ""];

    var y let es practicamente lo mismo
*/