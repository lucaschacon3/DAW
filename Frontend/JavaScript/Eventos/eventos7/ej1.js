const autores = [
    new Map([
        ["autor", "Juan Rulfo"],
        ["titulo", "Pedro Páramo"],
        ["año", "2014"]
    ]),
    new Map([
        ["autor", "Juan Rulfo"],
        ["titulo", "El Llano en Llamas"],
        ["año", "2013"]
    ]),
    new Map([
        ["autor", "Rosa Montero"],
        ["titulo", "Cuentos verdaderos"],
        ["año", "2024"]
    ]),
    new Map([
        ["autor", "Pablo Neruda"],
        ["titulo", "Veinte poemas de amor y una canción desesperada"],
        ["año", "2013"]
    ]),
    new Map([
        ["autor", "Almudena Grandes"],
        ["titulo", "La madre de Frankenstein"],
        ["año", "2020"]
    ]),
    new Map([
        ["autor", "Miguel de Cervantes Saavedra"],
        ["titulo", "Don Quijote de la Mancha"],
        ["año", "1605"]
    ]),
    new Map([
        ["autor", "Jorge Luis Borges"],
        ["titulo", "Ficciones"],
        ["año", "2014"]
    ]),
    new Map([
        ["autor", "Rosa Chacel"],
        ["titulo", "Memorias de Leticia Valle"],
        ["año", "1945"]
    ]),
    new Map([
        ["autor", "Pablo Neruda"],
        ["titulo", "Antología poética"],
        ["año", "2014"]
    ]),
    new Map([
        ["autor", "Rosa Chacel"],
        ["titulo", "Saturnal"],
        ["año", "1972"]
    ]),
    new Map([
        ["autor", "Carmen Laforet"],
        ["titulo", "La Isla de los Demonios"],
        ["año", "1952"]
    ]),
    new Map([
        ["autor", "Jorge Luis Borges"],
        ["titulo", "El sur"],
        ["año", "1953"]
    ]),
    new Map([
        ["autor", "Pablo Neruda"],
        ["titulo", "Confieso que he vivido"],
        ["año", "2010"]
    ])
];


let selectAutores = document.getElementById("idSelectAutores");
let tbodyAutores = document.getElementById("idTbodyAutores");


let autoresNombre= new Array()
autores.forEach((e,i)=>{
    autoresNombre[i]=e.get(`autor`)
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
        
        if(selectAutores.value===e.get(`autor`)) {
            let creado = crearElemento("tr",``,tbodyAutores)
            crearElemento("td",`${e.get(`titulo`)}`,creado)
            crearElemento("td",`${e.get(`año`)}`,creado)
        }
        
    })
    
}
