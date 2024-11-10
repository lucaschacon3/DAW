<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>reservas</title>
    <style>
        * {
            padding: 0.3em;
            margin: 0.3em;
        }

        form {
            border: 1px solid #000;
            height: 400px;
            width: 600px;
            margin: auto;
        }
    </style>
</head>

<body>

    <?php

    // Comprobamos si existe el fichero JSON
    $ruta = "reservas.json";
    if (file_exists($ruta)) {
        $salas = json_decode(file_get_contents($ruta), true);
    } else {
        echo "El fichero no existe";
        exit();
    }

    // Mostramos el formulario
    $fecha = date('d / m / y');
    echo "<form action='' method='post'>";
    echo "<h1>Reservas $fecha</h1>";

    foreach ($salas as $sala => $detalles) {
        echo "<label for='$sala'>Sala $sala</label>";
        echo "<input type='number' name='$sala' value='0' min='0'>";
        echo " Horas disponibles: {$detalles['horas']}<br>"; // Usamos {$detalles['horas']} para acceder al valor correctamente
    }

    echo "<button type='submit'>Reservar</button>";
    echo "<button><a href=reservas.php> Recargar</a></button>";
    echo "</form>";

    // Decrementamos las salas de $_POST["salas"]
    foreach ($salas as $sala => &$detalles) {//IMPORTANTE poner referencia & para que actualize
        if (isset($_POST[$sala])) { // Solo actualizamos si el formulario tiene este campo
            $horasReservadas = intval($_POST[$sala]);
            $detalles["horas"] = max(0, intval($detalles["horas"]) - $horasReservadas); // Decrementa horas, pero no menos de 0
        }
    }

    // Guardamos los cambios en el archivo JSON
    file_put_contents($ruta, json_encode($salas, JSON_PRETTY_PRINT));

    ?>

</body>

</html>