var op = 0;
function Subir() {

  if (op > 1) {
    op = op - 1;
    Pintar();
  }
}

function Bajar() {

  if (op < 4) {
    op = op + 1;
    Pintar();
  }
}

function Pintar() {
  if (op == 1) {
    document.getElementById("1").style.backgroundColor = "red";
    document.getElementById("2").style.backgroundColor = "white";
    document.getElementById("3").style.backgroundColor = "white";
    document.getElementById("4").style.backgroundColor = "white";
  } else if (op == 2) {
    document.getElementById("1").style.backgroundColor = "white";
    document.getElementById("2").style.backgroundColor = "red";
    document.getElementById("3").style.backgroundColor = "white";
    document.getElementById("4").style.backgroundColor = "white";
  } else if (op == 3) {
    document.getElementById("1").style.backgroundColor = "white";
    document.getElementById("2").style.backgroundColor = "white";
    document.getElementById("3").style.backgroundColor = "red";
    document.getElementById("4").style.backgroundColor = "white";
  } else if (op == 4) {
    document.getElementById("1").style.backgroundColor = "white";
    document.getElementById("2").style.backgroundColor = "white";
    document.getElementById("3").style.backgroundColor = "white";
    document.getElementById("4").style.backgroundColor = "red";
  }
}
function esPar() {
  var numero = document.getElementById("introducir").value;
  if (numero % 2 == 0) {
    return true;
  } else {
    return false;
  }
}

function esPrimo() {
  var numero = document.getElementById("introducir").value;
  if (numero <= 1) {
    return false;
  }
  // Comprobamos si el número es divisible por algún número menor que él mismo 
  for (let i = 2; i < numero; i++) {
    if (numero % i === 0) {
      return false;
    }
  }
  return true;
}

function Calcular() {
  if (op == 1) {
    if (esPar()) {
      document.getElementById("resultado").innerHTML = "ES PAR"
    } else {
      document.getElementById("resultado").innerHTML = "NO ES PAR"
    }
  } else if (op == 2) {
    if (!esPar()) {
      document.getElementById("resultado").innerHTML = "ES IMPAR"
    } else {
      document.getElementById("resultado").innerHTML = "ES IMPAR"
    }
  } else if (op == 3) {
    if (esPrimo()) {
      document.getElementById("resultado").innerHTML = "ES PRIMO"
    } else {
      document.getElementById("resultado").innerHTML = "NO ES PRIMO"
    }
  }
}



