<?php
if (isset($_REQUEST["nombre"]) && !empty($_REQUEST["nombre"])) { //pregunta si usa una variable
    echo 'Hola ' . ($_REQUEST["nombre"]); //se concatena con .// request coje get y post
} else {
    echo 'Hola mundo';
}


/*
    Version corta y avanzada
    $nombre = $_GET["nombre"] ?? "mundo" //si no existe nombre le asigna "mundo"
    echo 'Hola ["nombre"]'
    */
?>
