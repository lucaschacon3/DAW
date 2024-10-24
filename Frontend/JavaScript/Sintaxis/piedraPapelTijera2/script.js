/*----------DECLARAR VARIABLES-----------*/
const PIEDRA = `piedra`;
const PAPEL = `papel`;
const TIJERA = `tijera`;

let opcionMaquina = [PIEDRA, PAPEL, TIJERA];
const GANAR = [`piedra-tijera`, `tijera-papel`, `papel-piedra`];//combinaciones ganadoras
let infoJugador = new Map([
    [`nombre`, ``],
    [`ganadas`, 0],
    [`perdidas`, 0],
    [`empatadas`, 0]
]);





/*----------FUNCION GENERAR OPCION ALEATORIA-----------*/
function generarOpcionMaquina() {
  let numAleatorio = Math.floor(Math.random() * 3);
  return opcionMaquina[numAleatorio];
}






/*----------FUNCION MAIN-----------*/
function jugar() {
  let opcionJugador = ``;

  do {
    opcionJugador = parseInt(prompt(`Introduce piedra(0), papel(1), tijera(2)`));
  } while (opcionJugador > 2 || opcionJugador < 0);

  let jugador = opcionMaquina[opcionJugador];
  let maquina = generarOpcionMaquina();

  alert(`Jugador: ${jugador} | Máquina: ${maquina}
    \n ${determinaGanador(jugador, maquina)}`);
}






/*----------FUNCION QUIEN GANA-----------*/
function determinaGanador(jugador, maquina) {
    let jugada = `${jugador}-${maquina}`;

    if (jugador === maquina) {
        infoJugador.set(`empatadas`, infoJugador.get(`empatadas`) + 1);
        return `EMPATE`;
    } else if (GANAR.includes(jugada)) {
        infoJugador.set(`ganadas`, infoJugador.get(`ganadas`) + 1);
        return `HAS GANADO`;
    } else {
        infoJugador.set(`perdidas`, infoJugador.get(`perdidas`) + 1);
        return `HAS PERDIDO`;
    }
}




/*----------INICIO DEL JUEGO-----------*/
infoJugador.set(`nombre`, prompt(`¿Cómo te llamas?`));

do {
   jugar();
} while (confirm(`¿Desea continuar?`));

document.write(
    `Nombre = ${infoJugador.get(`nombre`)}<br>
    Partidas ganadas = ${infoJugador.get(`ganadas`)}<br>
    Partidas perdidas = ${infoJugador.get(`perdidas`)}<br>
    Partidas empatadas = ${infoJugador.get(`empatadas`)}`
);
