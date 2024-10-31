let divPosicion = document.getElementById('posicion');

document.addEventListener('mousemove', (event) => {
    const x = event.clientX;
    const y = event.clientY;
    divPosicion.innerHTML = `Posición para X: ${x}<br> Posición para Y: ${y}`;
});