<?php
// Ruta del archivo de stock
$filePath = 'stock.json';

// Cargar inventario desde el archivo stock.data
if (file_exists($filePath)) {
    $inventario = json_decode(file_get_contents($filePath), true);
} else {
    echo "Error: el archivo de inventario no existe.";
    exit();
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Carrito Compra</title>
    <style>
        * { margin: 0.5em; padding: 0.5em; }
        input { height: 20px; width: 30px; }
    </style>
</head>
<body>
    <h2>Bienvenido <?php echo htmlspecialchars($_GET["nombre"]); ?>!</h2>
    <form action="" method="post">
        <?php
        // Inicializar carrito y valores por defecto
        $carrito = [];
        if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST["actualizar"])) {
            foreach ($inventario as $producto => $datos) {
                $carrito[$producto] = isset($_POST[$producto]) ? intval($_POST[$producto]) : 0;
            }
        }

        // Mostrar formulario de productos
        foreach ($inventario as $producto => $datos) {
            // Obtener cantidad del carrito o establecer a 0 si no hay
            $cantidad = isset($carrito[$producto]) ? $carrito[$producto] : 0;
            echo "<label for='{$producto}'> " . ucfirst($producto) . ": </label>";
            echo "<input type='number' name='{$producto}' id='{$producto}' value='{$cantidad}' min='0'>";
            echo $datos["precio"] . " € | Stock: " . $datos["stock"] . "<br>";
        }
        ?>
        <button type='submit' name='actualizar'>ACTUALIZAR</button>
    </form>

    <?php
    // Procesar la actualización del carrito
    if ($_SERVER["REQUEST_METHOD"] == "POST") {
        if (isset($_POST["actualizar"])) {
            echo "<h3>Resumen de pedido:</h3>";
            $precioTotal = 0;
            $pedidoValido = true;

            foreach ($inventario as $producto => $datos) {
                $cantidad = intval($_POST[$producto]);
                if ($cantidad > $datos["stock"]) {
                    echo "Lo siento, no hay suficiente stock para " . ucfirst($producto) . ".<br>";
                    $pedidoValido = false;
                } elseif ($cantidad > 0) { // Mostrar solo si la cantidad es mayor a 0
                    $carrito[$producto] = $cantidad;
                    $precioTotal += $cantidad * $datos["precio"];
                    echo ucfirst($producto) . ": " . $cantidad . " Unidades <br>";
                }
            }

            if ($precioTotal > 0) {
                echo "<br>Precio Total: " . $precioTotal . " €<br>";

                if ($pedidoValido) {
                    echo "<form method='post'>";
                    echo "<button type='submit' name='confirmar'>CONFIRMAR PEDIDO</button>";
                    echo "</form><br>";
                } else {
                    echo "<p style='color:red;'>Por favor, ajusta las cantidades.</p>";
                }
            } else {
                echo "<p style='color:red;'>No se ha seleccionado ninguna unidad válida para comprar.</p>";
            }
        }

        if (isset($_POST['confirmar'])) {
            // Confirmación del pedido y actualización de stock
            foreach ($carrito as $producto => $cantidad) {
                $inventario[$producto]["stock"] = (int)$inventario[$producto]["stock"] - $cantidad;
            }

            // Guardar el nuevo inventario en stock.data
            if (file_put_contents($filePath, json_encode($inventario, JSON_PRETTY_PRINT))) {
                echo "<h3>¡Compra realizada y stock actualizado!</h3>";
            } else {
                echo "<p style='color:red;'>Error al actualizar el stock en el archivo.</p>";
            }

            echo "<button><a href=''>Volver a la tienda</a></button><br>";
        }
    }
    ?>
</body>
</html>
