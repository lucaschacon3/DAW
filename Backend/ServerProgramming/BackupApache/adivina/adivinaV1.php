<?php 
//Este ejercicio consiste en un formulario donde el usuario adivina un número 
//predefinido. Usaremos los parámetros URL para almacenar el número de intentos 
//y el número a adivinar.

//Explicación: El número a adivinar y el contador de intentos se pasan a través 
//de la URL. Cada intento incrementa el contador y mantiene el número predefinido. 
//Al acertar, se muestra cuántos intentos ha hecho el usuario.

?>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Adivina el Número</title>
</head>
<body>
    <form action="" method="get">
        <label for="numero">Introduce un número (0-10):</label>
        <input type="number" name="numero" id="numero">
        <button type="submit">Comprobar</button>
    </form>

    <?php
    // Si no hay un número a adivinar, lo generamos
    if (!isset($_GET['numeroAdivinar'])) {
        $numeroAdivinar = rand(0, 10);
        $intentos = 0;
    } else {
        $numeroAdivinar = $_GET['numeroAdivinar'];
        $intentos = $_GET['intentos'] + 1;
    }

    // Comprobamos si se ha enviado un número
    if (isset($_GET['numero'])) {
        $numeroUsuario = $_GET['numero'];
        if ($numeroUsuario == $numeroAdivinar) {
            echo "¡Has acertado en $intentos intentos!";
        } elseif ($numeroUsuario > $numeroAdivinar) {
            echo "El número introducido es mayor.";
        } else {
            echo "El número introducido es menor.";
        }
    }

    // Guardamos el número a adivinar y los intentos en la URL
    echo "<a href='?numeroAdivinar=$numeroAdivinar&intentos=$intentos'>Reintentar</a>";
    ?>
</body>
</html>
