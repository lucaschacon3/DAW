let intervalID;

function startClock() {
    intervalID = setInterval(() => {
            document.title = new Date(); // Cambia el título del documento
        }, 1000);
}

function stopClock() {
    clearInterval(intervalID);
    document.title = "Hora detenida";
}

startClock()