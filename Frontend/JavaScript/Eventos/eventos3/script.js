let divPosicion = document.getElementById('caja')

document.addEventListener('mousemove', (event) => {
    const x = event.clientX
    const y = event.clientY
    divPosicion.setAttribute(`style`, `top: ${x}px;`)
    divPosicion.setAttribute(`style`, `left: ${y}px;`)
});