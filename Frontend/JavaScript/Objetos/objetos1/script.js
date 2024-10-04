let pagina= ()=> {
    let ventana= window.open()
    ventana.document.write(`hola en la otra pagina`)
}

var idA=setTimeout(pagina,3000);