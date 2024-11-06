<?php

session_start();
function iniciarSesion()
{
    if (!isset($_SESSION["numAleatorio"])) {
        $_SESSION["numAleatorio"] = rand(0, 10);
    }

    if (!isset($_SESSION["intentos"])) {
        $_SESSION["intentos"] = 5;
    }
}

function mostrarFormulario()
{

    echo "<form action=post>";
    echo "<label for=numero>Introduce un numero (0-10):</label>";
    echo "<input type=text name=numero id=>";

    echo "<button type=submit>Adivina</button>";
    echo "</form>";
}

function ganar()
{
    if (!isset($_REQUEST["numero"]) || $_REQUEST["numero"] == "") {
        echo "Tienes " . $_SESSION["intentos"] . " intentos";
    } else {
        if (intval($_SESSION["numAleatorio"]) === intval($_REQUEST["numero"])) {
            echo "Has acertado! ";
            session_destroy();
        }elseif(intval($_SESSION["intentos"])==0){
            echo "Has perdido";
            session_destroy();
        }else {
            $_SESSION["intentos"] = $_SESSION["intentos"] - 1;
            echo "Incorrecto, te quedan " . $_SESSION["intentos"] . " intentos";
        }
    }
}
