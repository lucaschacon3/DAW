function Suma(){
    var numero1= document.getElementById ("numero1");
    var numero2= document.getElementById ("numero2");
    var resultado= document.getElementById ("resultado");

    var suma=+(numero1.value)+(+(numero2.value));
    resultado.value=suma;
    

}

function Resta(){
    var numero1= document.getElementById ("numero1");
    var numero2= document.getElementById ("numero2");
    var resultado= document.getElementById ("resultado");

    var resta=(numero1.value)-(numero2.value);
    resultado.value=resta;
    

}

function Producto(){
    var numero1= document.getElementById ("numero1");
    var numero2= document.getElementById ("numero2");
    var resultado= document.getElementById ("resultado");

    var producto=(numero1.value)*(numero2.value);
    resultado.value=producto;
    

}

function Division(){
    var numero1= document.getElementById ("numero1");
    var numero2= document.getElementById ("numero2");
    var resultado= document.getElementById ("resultado");

    var division=(numero1.value)/(numero2.value);
    resultado.value=division;
    

}

function Limpiar(){
    var numero1= document.getElementById ("numero1");
    var numero2= document.getElementById ("numero2");
    var resultado= document.getElementById ("resultado");

    numero1.value="";
    numero2.value="";
    resultado.value="";
    

}
