<?php
// Ruta del archivo de stock
$filePath = 'stock.json';

// Cargar inventario desde el archivo stock.json
if (file_exists($filePath)) {
    $inventario = json_decode(file_get_contents($filePath), true);
} else {
    echo "Error: el archivo de inventario no existe.";
    exit();
}

// Verificar si el usuario es admin
$isAdmin = isset($_GET["nombre"]) && $_GET["nombre"] === "admin";
$carrito = []; // Variable global para el carrito

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
    <h2>Bienvenido <?php echo htmlspecialchars($_GET["nombre"]); ?>!</h2>
    <form action="" method="post">
        <?php
        // Si el usuario es admin, permitir editar precio y stock
        if ($isAdmin) {
            echo "<h3>Editar inventario:</h3>";
            foreach ($inventario as $producto => $datos) {
                echo "<label>" . ucfirst($producto) . ": </label>";
                echo "Precio: <input type='number' name='{$producto}_precio' value='" . htmlspecialchars($datos["precio"]) . "' step='0.01'> ";
                echo "Stock: <input type='number' name='{$producto}_stock' value='" . htmlspecialchars($datos["stock"]) . "' min='0'><br>";
            }
            echo "<button type='submit' name='actualizar_admin'>Actualizar Inventario</button>";
        } else {
            // Si no es admin, mostrar formulario de compra
            echo "<h3>Selecciona productos:</h3>";
            foreach ($inventario as $producto => $datos) {
                echo "<label for='{$producto}'>" . ucfirst($producto) . ": </label>";// El ucfirst es para que la primera letra sea mayuscula
                echo "<input type='number' name='{$producto}' id='{$producto}' value='0' min='0'> ";
                echo $datos["precio"] . " € | Stock: " . $datos["stock"] . "<br>";
            }
            echo "<button type='submit' name='actualizar'>Actualizar Carrito</button>";
        }
        ?>
    </form>

    <?php
    // Procesar la actualización del inventario por el admin
    if ($_SERVER["REQUEST_METHOD"] == "POST") {
        if ($isAdmin && isset($_POST["actualizar_admin"])) {
            foreach ($inventario as $producto => $datos) {
                if (isset($_POST["{$producto}_precio"]) && isset($_POST["{$producto}_stock"])) {
                    $inventario[$producto]["precio"] = floatval($_POST["{$producto}_precio"]);
                    $inventario[$producto]["stock"] = intval($_POST["{$producto}_stock"]);
                }
            }

            // Guardar el nuevo inventario en stock.json
            if (file_put_contents($filePath, json_encode($inventario, JSON_PRETTY_PRINT))) { // El ultimo parametro es para que se imprima tabulado
                echo "<h3>Inventario actualizado correctamente,<a href= >ACEPTAR</a></h3>";
            } else {
                echo "<p style='color:red;'>Error al guardar los cambios en el archivo.</p>";
            }
            // Recargar el archivo para reflejar los cambios en el formulario
            $inventario = json_decode(file_get_contents($filePath), true);
        }

        // Procesar el pedido del cliente
        if (!$isAdmin && isset($_POST["actualizar"])) {
            echo "<h3>Resumen de pedido:</h3>";
            $precioTotal = 0;
            $pedidoValido = true;

            foreach ($inventario as $producto => $datos) {
                $cantidad = intval($_POST[$producto]);
                if ($cantidad > $datos["stock"]) {
                    echo "Lo siento, no hay suficiente stock para " . ucfirst($producto) . ".<br>";
                    $pedidoValido = false;
                } elseif ($cantidad > 0) {
                    $carrito[$producto] = $cantidad;
                    $precioTotal += $cantidad * $datos["precio"];
                    echo ucfirst($producto) . ": " . $cantidad . " Unidades <br>";
                }
            }

            echo "<br>Precio Total: " . $precioTotal . " €<br>";

            if ($pedidoValido) {
                echo "<form method='post'>";
                echo "<button type='submit' name='confirmar'>CONFIRMAR PEDIDO</button>";
                echo "</form><br>";
            } else {
                echo "<p style='color:red;'>Por favor, ajusta las cantidades.</p>";
            }
        }

        // Confirmar la compra y actualizar el stock
        if (isset($_POST['confirmar']) && !$isAdmin) {
            foreach ($carrito as $producto => $cantidad) {
                $inventario[$producto]["stock"] = floatval($inventario[$producto]["stock"]) - $cantidad;
            }

            // Guardar el nuevo stock en stock.json
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
