<?php

include 'funciones.php';
list($inventario, $isAdmin, $carrito) = inicializar();// inicializamos las variables

session_start();
autenticarUsuario(); // Verifica que esté autenticado

?>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Carrito Compra</title>
    <style>
        * { margin: 0.5em; padding: 0.5em; }
        input { height: 20px; width: 60px; }
    </style>
</head>
<body>
    <h2>Bienvenido <?php echo htmlspecialchars($_POST["username"]);?>!</h2>
    <form action="" method="post">
        <?php
        // Mostrar el formulario dependiendo del rol del usuario
        mostrarFormulario($isAdmin, $inventario);
        ?>
    </form>

    <?php
    // Procesar las solicitudes de actualización del inventario y el carrito
    procesarSolicitud($isAdmin, $inventario, $carrito);
    ?>
</body>
</html>
