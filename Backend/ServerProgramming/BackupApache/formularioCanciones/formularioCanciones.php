<?php
//Este ejercicio requiere crear un formulario para buscar canciones, 
//donde se validan los datos ingresados sin usar sesiones.


//El formulario permite buscar canciones y valida que la entrada no esté 
//vacía y que tenga al menos 3 caracteres. Se utiliza htmlspecialchars para 
//evitar inyecciones de código al mostrar la entrada.
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Búsqueda de Canciones</title>
</head>
<body>
    <form action="" method="get">
        <label for="cancion">Buscar canción:</label>
        <input type="text" name="cancion" id="cancion">
        <button type="submit">Buscar</button>
    </form>

    <?php
    if (isset($_GET['cancion'])) {
        $cancion = $_GET['cancion'];
        if (empty($cancion)) {
            echo "El campo de búsqueda no puede estar vacío.";
        } elseif (strlen($cancion) < 3) {
            echo "La búsqueda debe contener al menos 3 caracteres.";
        } else {
            echo "Buscando la canción: " . htmlspecialchars($cancion);
        }
    }
    ?>
</body>
</html>
