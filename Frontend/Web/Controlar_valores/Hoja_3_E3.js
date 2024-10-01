function MensajeAlerta(){
    var texto= document.getElementById ("texto");
    var numero= document.getElementById ("numero");
    var password= document.getElementById ("password");
    var fecha= document.getElementById ("fecha");

    var hora= document.getElementById ("hora");
    var radio= document.getElementById ("radio");
    var checkbox= document.getElementById ("checkbox");
    var check= document.getElementById ("check");


    
    alert("Texto: "+texto.value+"\n"
    +"Numero: "+numero.value+"\n"
    +"Password: "+password.value+"\n"
    +"Fecha: "+fecha.value+"\n"
    +"Hora: "+hora.value+"\n"
    +"Radio: "+radio.value+"\n"
    +"Checkbox: "+checkbox.checked+"\n"
    +"Check: "+check.checked+"\n"
    )

}
