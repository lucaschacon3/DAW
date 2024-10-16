<?php 

session_start()
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>visitas</title>
</head>
<body>
    <?php
    define("RUTA_FICHERO", "/home/daw2/Desktop/DAW-PRACTICE/Backend/ServerProgramming/PHP/visitas/cuenta.txt");
    $globales= file_get_contents(RUTA_FICHERO);
    $globales++;
    file_put_contents(RUTA_FICHERO,$globales);

    if (!isset($_SESSION["contador"])) {

        $_SESSION["contador"]=1;
    
    }else{
        $_SESSION["contador"]=$_SESSION["contador"]+1;
    }

    echo "<p> Visitas a la pagina: </p>" . $_SESSION["contador"];
    echo "<p> Visitas totales: </p>" . $globales;
    ?>

</body>
</html>