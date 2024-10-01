function contarLabel() {
    let miDiv = document.getElementById("divFrutas");
    let misLbl = miDiv.getElementsByTagName("label");
    alert("La div 'divFrutas' tiene " + misLbl.length + " etiquetas label");
}

function cambiarColor() {
    let moradas = document.getElementsByClassName("morado");
    for (let i = 0; i < moradas.length; i++) {
        moradas[i].style.color = "#FFFFFF";
    }
}

function marcarFrutas() {
    let todasfrutas=document.getElementById("todasfrutas");
    let fruta = document.getElementsByName("fruta");

    if (todasfrutas.checked==true) {
        for (let i = 0; i < fruta.length; i++) {
            if (fruta[i].type == "checkbox") {
                fruta[i].checked = true;
            }
        }
    }else{
        for (let i = 0; i < fruta.length; i++) {
            if (fruta[i].type == "checkbox") {
                fruta[i].checked = false;
            }
        }
    }
}

function marcarVerduras() {

    let todasverduras=document.getElementById("todasverduras");
    let verduras = document.getElementsByName("verdura");

    if (todasverduras.checked==true) {
        for (let i = 0; i < verduras.length; i++) {
            if (verduras[i].type == "checkbox") {
                verduras[i].checked = true;
            }
        }
    }else{
        for (let i = 0; i < verduras.length; i++) {
            if (verduras[i].type == "checkbox") {
                verduras[i].checked = false;
            }
        }
    }
    
}


let morado=document.querySelector("label.morado");//devuelve el primer elemento
console.log(morado);

let morados=document.querySelectorAll("label.morado");//Devuelve una colección con todos los elementos seleccionado
console.log(morados);