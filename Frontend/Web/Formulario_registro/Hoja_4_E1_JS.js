function validar(){
    var nombre = document.getElementById("nombre").value;
    var apellidos = document.getElementById("apellidos").value;
    var direccion = document.getElementById("direccion").value;
    var edad = document.getElementById("edad").value;
    var acepto = document.getElementById("acepto").checked;
    var estudios = document.getElementById("estudios").value;
    var password = document.getElementById("password").value;
    var rpassword = document.getElementById("rpassword").value;
    var error= document.getElementById("error");

    if (nombre.length<2) {
        error.style.display = "block";
        return false;
    }
    if (edad<18) {
        error.style.display = "block";
        return false;
    }
    if (apellidos<10) {
        error.style.display = "block";
        return false;
    }
    if (direccion.length<1) {
        error.style.display = "block";
        return false;
    }
    if (!acepto) {
        error.style.display = "block";;
        return false;
    }
    if (estudios=="") {
        error.style.display = "block";
        return false;
    }
    if (password.length<8) {
        error.style.display = "block";
        return false;
    }
    if (password!=rpassword) {
        error.style.display = "block";
        return false;
    }
    alert("Todo correcto");
    
    return true;
}