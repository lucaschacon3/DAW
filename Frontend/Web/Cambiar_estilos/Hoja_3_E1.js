function cambiarTexto(){
    var text= document.getElementById ("div");
    var almacen= document.getElementById("textoIntroducido");
    textActual=almacen.value;
    text.innerHTML=textActual;

}

function cambiarFondo(){
    var text= document.getElementById ("div");
    var almacen= document.getElementById("colorFondo");
    textActual=almacen.value;
    text.style.backgroundColor=textActual;

}

function cambiarBorde(){
    var text= document.getElementById ("div");
    var almacen= document.getElementById("colorBorde");
    textActual=almacen.value;
    text.style.borderBlockColor=textActual;
}

function cambiarColorTexto(){
    var text= document.getElementById ("div");
    var almacen= document.getElementById("colorTexto");
    textActual=almacen.value;
    text.style.color=textActual;
}