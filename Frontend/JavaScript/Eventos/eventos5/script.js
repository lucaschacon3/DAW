let info=[
    {"Autor": "Carmen Laforet", "Titulo": "Nada", "Fecha": "1945"},
    {"Autor": "Juan Rulfo", "Titulo": "Pedro Páramo", "Fecha": "2014"},
    {"Autor": "Juan Rulfo", "Titulo": "El Llano en Llamas", "Fecha": "2013"},
    {"Autor": "Rosa Montero", "Titulo": "Cuentos verdaderos", "Fecha": "2024"},
    {"Autor": "Pablo Neruda", "Titulo": "Veinte poemas de amor y una canción desesperada", "Fecha": "2013"},
    {"Autor": "Almudena Grandes", "Titulo": "La madre de Frankenstein", "Fecha": "2020"},
    {"Autor": "Miguel de Cervantes Saavedra", "Titulo": "Don Quijote de la Mancha", "Fecha": "1605"},
    {"Autor": "Jorge Luis Borges", "Titulo": "Ficciones", "Fecha": "2014"},
    {"Autor": "Rosa Chacel", "Titulo": "Memorias de Leticia Valle", "Fecha": "1945"},
    {"Autor": "Pablo Neruda", "Titulo": "Antología poética", "Fecha": "2014"},
    {"Autor": "Rosa Chacel", "Titulo": "Saturnal", "Fecha": "1972"},
    {"Autor": "Carmen Laforet", "Titulo": "La Isla de los Demonios", "Fecha": "1952"},
    {"Autor": "Jorge Luis Borges", "Titulo": "El sur", "Fecha": "1953"},
    {"Autor": "Pablo Neruda", "Titulo": "Confieso que he vivido", "Fecha": "2010"}
]

let autor= document.getElementById(`idAutores`)


autor.addEventListener(`change`, tabla)
 

function tabla() {

    let eliminar= document.querySelectorAll(`td`)
    eliminar.forEach(e=>{
        e.innerHTML=""
    })

    if(autor.value==1){
        info.forEach(e=>{
            crearElemento(`tr`, e.Titulo, document.getElementById(`idTitulo`))
            crearElemento(`tr`, e.Fecha, document.getElementById(`idFecha`))
            
        })
    }
    
    if (autor.value==2) {
        info.forEach(e=>{
            if (e.Autor===`Carmen Laforet`) {
                crearElemento(`tr`, e.Titulo, document.getElementById(`idTitulo`))
                crearElemento(`tr`, e.Fecha, document.getElementById(`idFecha`))
            }
        })
    }

    if (autor.value==3) {
        info.forEach(e=>{
            if (e.Autor===`Juan Rulfo`) {
                crearElemento(`tr`, e.Titulo, document.getElementById(`idTitulo`))
                crearElemento(`tr`, e.Fecha, document.getElementById(`idFecha`))
            }
        })
    }

    if (autor.value==4) {
        info.forEach(e=>{
            if (e.Autor===`Rosa Montero`) {
                crearElemento(`tr`, e.Titulo, document.getElementById(`idTitulo`))
                crearElemento(`tr`, e.Fecha, document.getElementById(`idFecha`))
            }
        })
    }

    if (autor.value==5) {
        info.forEach(e=>{
            if (e.Autor===`Pablo Neruda`) {
                crearElemento(`tr`, e.Titulo, document.getElementById(`idTitulo`))
                crearElemento(`tr`, e.Fecha, document.getElementById(`idFecha`))
            }
        })
    }

    if (autor.value==6) {
        info.forEach(e=>{
            if (e.Autor===`Almudena Grandes`) {
                crearElemento(`tr`, e.Titulo, document.getElementById(`idTitulo`))
                crearElemento(`tr`, e.Fecha, document.getElementById(`idFecha`))
            }
        })
    }

    if (autor.value==7) {
        info.forEach(e=>{
            if (e.Autor===`Miguel de Cervantes Saavedra`) {
                crearElemento(`tr`, e.Titulo, document.getElementById(`idTitulo`))
                crearElemento(`tr`, e.Fecha, document.getElementById(`idFecha`))
            }
        })
    }

    if (autor.value==8) {
        info.forEach(e=>{
            if (e.Autor===`Jorge Luis Borges`) {
                crearElemento(`tr`, e.Titulo, document.getElementById(`idTitulo`))
                crearElemento(`tr`, e.Fecha, document.getElementById(`idFecha`))
            }
        })
    }

    if (autor.value==9) {
        info.forEach(e=>{
            if (e.Autor===`Rosa Chacel`) {
                crearElemento(`tr`, e.Titulo, document.getElementById(`idTitulo`))
                crearElemento(`tr`, e.Fecha, document.getElementById(`idFecha`))
            }
        })
    }
    

}

function crearElemento(tipo, contenido, padre) {// padre= document.body
    let hijo = document.createElement(tipo);
    hijo.innerHTML = contenido;
    padre.appendChild(hijo);
  }