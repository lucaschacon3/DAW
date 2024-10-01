function validar(){
    var nombre = document.getElementById("nombre").value;
    var email = document.getElementById("email").value;
    var mensaje = document.getElementById("mensaje").value;
    var estudios= document.getElementById("estudios").value;
    var error= document.getElementById("error");
    var solicitud= document.getElementById("solicitud").value;
    


    if (nombre.length<2) {
        error.style.display = "block";
        document.getElementById("nombre").style.borderColor="red";
        return false;
    }else{
        document.getElementById("nombre").style.borderColor= "black";
    }

    if (email.length<1) {
        error.style.display = "block";
        document.getElementById("email").style.borderColor="red";

        return false;
    }else{
        document.getElementById("email").style.borderColor= "black";
    }

    if (estudios==0) {
        error.style.display = "block";
        return false;
    }
    if (mensaje.length<1) {
        document.getElementById("mensaje").style.borderColor="red";
        error.style.display = "block";
        return false;
    }else{
        document.getElementById("mensaje").style.borderColor= "black";
    }

    if (estudios==2) {
        if (solicitud.length<1) {
            document.getElementById("solicitud").style.borderColor="red";
            error.style.display = "block";
            return false;
        }else{
            document.getElementById("solicitud").style.borderColor="black";
        }
    }
        
    alert("Todo correcto");
    
    return true;
}
function estado_solicitud(){
    var nsolicitud= document.getElementById("nsolicitud");
    nsolicitud.style.display = "block";
}