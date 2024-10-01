function LimpiaTexto1(){
    var text= document.getElementById ("texto1")
    text.value="";
}

function LimpiaTexto2(){
    var text= document.getElementById ("texto2")
    text.value="";
}

function CopiaTexto1(){
    var text= document.getElementById ("texto2");
    var almacen= document.getElementById("texto1");
    text.value=almacen.value;
}

function CopiaTexto2(){
    var text= document.getElementById ("texto1");
    var almacen= document.getElementById("texto2");
    text.value=almacen.value;
}