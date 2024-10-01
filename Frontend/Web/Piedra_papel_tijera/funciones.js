let puntos_usu = 0;
let puntos_ord = 0;
let puntos_usu_span;
let puntos_ord_span;
let resultado;
let img_Ord;

this.onload = function () {
    iniciar();
}

function iniciar() {
    puntos_usu_span = document.getElementById("puntos_Usu");
    puntos_ord_span = document.getElementById("puntos_Ord");
    resultado = document.getElementById("p_resultado");
    img_Ord = document.getElementById("img_ordenador");
    
}

function jugar(jugada_usu) {
    var jugada_ord = obtenerJug_Ordenador();

    // Actualizamos la imagen de la jugada del ordenador
    if (jugada_ord === "r") {
        document.getElementById("jugada_ordenador").innerHTML = '<img src="piedra.png" />';
    } else if (jugada_ord === "p") {
        document.getElementById("jugada_ordenador").innerHTML = '<img src="papel.png" />';
    } else if (jugada_ord === "t") {
        document.getElementById("jugada_ordenador").innerHTML = '<img src="tijeras.png" />';
    }
    
    // Mostramos la imagen
    document.getElementById("jugada_ordenador").style.display = "inline-block";

    if (jugada_usu === jugada_ord) {
        empate();
    } else if ((jugada_usu === "r" && jugada_ord === "t") ||
               (jugada_usu === "p" && jugada_ord === "r") ||
               (jugada_usu === "t" && jugada_ord === "p")) {
        jugador_Gana();
    } else {
        jugador_Pierde();
    }
}

function obtenerJug_Ordenador() {
    var eleccion;
    var numAleatorio = Math.floor(Math.random() * 3);
    if (numAleatorio === 0) {
        eleccion = "r"; // Piedra
    } else if (numAleatorio === 1) {
        eleccion = "p"; // Papel
    } else if (numAleatorio === 2) {
        eleccion = "t"; // Tijeras
    }
    return eleccion;
}

function jugador_Gana() {
    puntos_usu++;
    puntos_usu_span.textContent = puntos_usu;
    resultado.textContent = "¡Ganaste!";

}

function jugador_Pierde() {
    puntos_ord++;
    puntos_ord_span.textContent = puntos_ord;
    resultado.textContent = "¡Perdiste!";

}

function empate() {
    resultado.textContent = "¡Empate!";

}

