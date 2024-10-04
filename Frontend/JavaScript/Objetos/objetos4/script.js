let intervalID;

function startClock() {
    intervalID = setInterval(() => {
            document.write(`${new Date()} <br>`)
        }, 5000);
}
startClock()