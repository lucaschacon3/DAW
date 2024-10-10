let jugados = 0;
let ganados = 0;
let perdidos = 0;
do {
    let jugada = prompt("Escribe \"piedra\", \"papel\" o \"tijera\"");
    //GUARDAMOS UN NÚMERO ALEATORIO DE 1 AL 9
    let aleatorio = Math.floor((Math.random() * 9) + 1);
    let elige = "";
    if (aleatorio <= 3) {
        elige = "piedra";
    }
    else if (aleatorio <= 6) {
        elige = "papel";
    }
    else {
        elige = "tijera";
    }

    if ((jugada == "piedra") && (elige == "piedra")) {
        alert(jugada + "-" + elige + ": Empate");
    }
    else if ((jugada == "piedra") && (elige == "papel")) {
        alert(jugada + "-" + elige + ": Gana PC");
        perdidos++;
    }
    else if ((jugada == "piedra") && (elige == "tijera")) {
        alert(jugada + "-" + elige + ": Gana Jugador");
        ganados++;
    }
    else if ((jugada == "papel") && (elige == "papel")) {
        alert(jugada + "-" + elige+": Empate");
    }
    else if ((jugada == "papel") && (elige == "tijera")) {
        alert(jugada + "-" + elige + ": Gana PC");
        perdidos++;
    }
    else if ((jugada == "papel") && (elige == "piedra")) {
        alert(jugada + "-" + elige + ": Gana Jugador");
        ganados ++;
    }
    else if ((jugada == "tijera") && (elige == "tijera")) {
        alert(jugada + "-" + elige + ": Empate");
    }
    else if ((jugada == "tijera") && (elige == "piedra")) {
        alert(jugada + "-" + elige + ": Gana PC");
        perdidos++;
    }
    else if ((jugada == "tijera") && (elige == "papel")) {
        alert(jugada + "-" + elige + ": Gana Jugador");
        ganados++;
    }
    jugados ++;

} while (confirm("Jugar de nuevo"));

document.write("Partidas jugadas: " + jugados + "<br>");
document.write("Partidas ganadas: " + ganados + "<br>");
document.write("Partidas perdidas: " + perdidos + "<br>");
document.write("Partidas empatadas: " + (jugados-ganados-perdidos));