let autores=[
    [ "Carmen Laforet", "Nada",  "1945"],
    [ "Juan Rulfo", "Pedro Páramo",  "2014"],
    [ "Juan Rulfo", "El Llano en Llamas",  "2013"],
    [ "Rosa Montero", "Cuentos verdaderos",  "2024"],
    [ "Pablo Neruda", "Veinte poemas de amor y una canción desesperada",  "2013"],
    [ "Almudena Grandes", "La madre de Frankenstein",  "2020"],
    [ "Miguel de Cervantes Saavedra", "Don Quijote de la Mancha",  "1605"],
    [ "Jorge Luis Borges", "Ficciones",  "2014"],
    [ "Rosa Chacel", "Memorias de Leticia Valle",  "1945"],
    [ "Pablo Neruda", "Antología poética",  "2014"],
    [ "Rosa Chacel", "Saturnal",  "1972"],
    [ "Carmen Laforet", "La Isla de los Demonios",  "1952"],
    [ "Jorge Luis Borges", "El sur",  "1953"],
    [ "Pablo Neruda", "Confieso que he vivido",  "2010"]
]


let selectAutores = document.getElementById("idSelectAutores");
let tbodyAutores = document.getElementById("idTbodyAutores");


let autoresNombre= new Array()
autores.forEach((e,i)=>{
    autoresNombre[i]=e[0]
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
        
        if(selectAutores.value===e[0]) {
            let creado = crearElemento("tr",``,tbodyAutores)
            crearElemento("td",`${e[1]}`,creado)
            crearElemento("td",`${e[2]}`,creado)
        }
        
    })
    
}
