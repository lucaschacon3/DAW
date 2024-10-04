

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Adivina</title>
</head>
<body>
    <form action="" method="get">
        <div>
            <label for="numeroUsuario">Introduce un numero (0-10)</label>
            <input type="text" name="numeroUsuario" id="numeroUsuario">
            <button type="submit">Comprobar</button>
        </div>
    </form>
</body>
</html>

<?php
if (isset($_REQUEST["numeroUsuario"])) {
    $numeroUsuario = $_REQUEST["numeroUsuario"];

    echo "Número aleatorio: $numAleatorio <br>";

    if ($numeroUsuario == $numAleatorio) {
        echo "¡Has acertado!";
        // Opcional: reiniciar el número aleatorio después de acertar
        unset($_SESSION['numAleatorio']);
    } elseif ($numeroUsuario > $numAleatorio) {
        echo "El número introducido es mayor";
    } else {
        echo "El número introducido es menor";
    }
}
?>
