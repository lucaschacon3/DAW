autores=[
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
];

let selectAutores = document.getElementById("idSelectAutores");
let tbodyAutores = document.getElementById("idTbodyAutores");


let autoresNombre= new Array()
autores.forEach((e)=>{
    autoresNombre.push(e.Autor)
    
})
let autoresNoRepetidos = new Set(autoresNombre)


haceroption();
function haceroption(){
    autoresNoRepetidos.forEach((e)=>{ 
        crearElemento("option",e,selectAutores);
    })

}


function crearElemento(tipo, contenido, padre) {
    let hijo = document.createElement(tipo)
    hijo.innerHTML = contenido
    padre.appendChild(hijo)
    return hijo
}


selectAutores.addEventListener("change", anadirDatos);
function anadirDatos(e){
    tbodyAutores.innerHTML="";
    autores.forEach(function(e){  
        
        if(selectAutores.value===e.Autor) {
            let creado = crearElemento("tr",``,tbodyAutores)
            crearElemento("td",`${e.Titulo}`,creado)
            crearElemento("td",`${e.Fecha}`,creado)
        }
        
    })
    
}