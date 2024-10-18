const parrafo1 = {
  titulo: "Primer bloque de párrafos",
  hijos: [
    "Este es el primer párrafo",
    "Este es el segundo párrafo",
    "Este es el tercer párrafo",
  ],
};

/*
const estructura = new Set();
estructura.add(parrafo1);
*/

crearElemento("h1", parrafo1.titulo, document.body)

parrafo1.hijos.forEach(e=>{
    crearElemento("p", e, document.body)
})

function crearElemento(tipo, contenido, padre) {
    let hijo= document.createElement(tipo)
    hijo.innerHTML=contenido
    padre.appendChild(hijo)
}

