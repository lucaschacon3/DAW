<?php 
//1. Blog Fake: Formulario que acumula mensajes
//Este ejercicio consiste en crear un formulario que, 
//con cada envío, va acumulando los mensajes enviados 
//previamente. Usaremos parámetros URL para encadenar 
//los mensajes sin usar sesiones ni cookies.



//Explicación: Cada vez que el usuario envía un mensaje, 
//el nuevo mensaje se concatena a los mensajes anteriores 
//y se pasa a través de la URL mediante el método GET. 
//Se usa el enlace para refrescar la página y actualizar 
//el área de texto con los mensajes acumulados.
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Blog Fake</title>
</head>
<body>
    <form action="" method="get">
        <label for="mensaje">Nuevo mensaje:</label>
        <input type="text" name="mensaje" id="mensaje">
        <button type="submit">Enviar</button>
        
        <!-- Enviamos los mensajes anteriores como un campo oculto -->
        <input type="hidden" name="mensajes" value="<?php echo isset($_GET['mensajes']) ? htmlspecialchars($_GET['mensajes']) : ''; ?>">
    </form>

    <h3>Mensajes:</h3>
    <textarea readonly rows="10" cols="50">
        <?php
            // Si hay mensajes anteriores, los mostramos
            if (isset($_GET['mensajes'])) {
                echo htmlspecialchars($_GET['mensajes']);
            }
        ?>
    </textarea>

    <?php
    // Encadenamos los mensajes con los anteriores
    if (isset($_GET['mensaje'])) {
        $nuevoMensaje = $_GET['mensaje'];
        $mensajesAnteriores = isset($_GET['mensajes']) ? $_GET['mensajes'] . "\n" : "";
        $mensajesAnteriores .= $nuevoMensaje;

        // Refrescamos la página con los mensajes concatenados
        header("Location: ?mensajes=" . urlencode($mensajesAnteriores));
        exit();
    }
    ?>
</body>
</html>

