<?php


$inventario = array(
    "camiseta" => array(
        "stock" => 10,
        "precio" => 11.99
    ),

    "pantalon" => array(
        "stock" => 15,
        "precio" => 17.99
    ),

    "sudadera" => array(
        "stock" => 12,
        "precio" => 15.25
    ),

    "zapatillas" => array(
        "stock" => 16,
        "precio" => 26.55
    )

);

?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Carrito Compra</title>
    <style>
        * {
            margin: 0.5em;
            padding: 0.5em;
        }

        input {
            height: 20px;
            width: 30px;
        }
    </style>
</head>

<body>
    <h2>Bienvenido <?php echo $_GET["nombre"] ?>!</h2>
    <form action="" method="post">



        <label for="camiseta"> Camiseta: </label>
        <input type="number" name="camiseta" id="camiseta" value="0">
        <?php echo $inventario["camiseta"]["precio"] . " €"; ?>
        <br>


        <label for="pantalon"> Pantalon: </label>
        <input type="number" name="pantalon" id="pantalon" value="0">
        <?php echo $inventario["pantalon"]["precio"] . " €"; ?>
        <br>

        <label for="sudadera"> Sudadera: </label>
        <input type="number" name="sudadera" id="sudadera" value="0">
        <?php echo $inventario["sudadera"]["precio"] . " €"; ?>
        <br>

        <label for="zapatillas"> Zapatillas: </label>
        <input type="number" name="zapatillas" id="zapatillas" value="0">
        <?php echo $inventario["zapatillas"]["precio"] . " €"; ?>
        <br>

        <button type="submit" name="actualizar">ACTUALIZAR</button>
    </form>


    <?php

/*
    define('RUTA_FICHERO', "stock.data");

    if (file_exists(RUTA_FICHERO)) {
        $contenido = file_get_contents(RUTA_FICHERO);
        $stock = unserialize($contenido);
    } else {
        $stock = [
            $inventario["camiseta"] => $inventario["camiseta"]["stock"],
            $inventario["pantalon"] => $inventario["pantalon"]["stock"],
            $inventario["sudadera"] => $inventario["sudadera"]["stock"],
            $inventario["zapatillas"] => $inventario["zapatillas"]["stock"]
        ];
        file_put_contents(RUTA_FICHERO, serialize($stock));
    }
    */

    if ($_SERVER["REQUEST_METHOD"] == "POST") {

        // ver stock
        /* 
        $stockCamiseta = intval($inventario["camiseta"]["stock"]);
        $inventario["camiseta"]["stock"] = $stockCamiseta - intval($_REQUEST["camiseta"]);

        $stockPantalon = intval($inventario["pantalon"]["stock"]);
        $inventario["pantalon"]["stock"] = $stockPantalon - intval($_REQUEST["pantalon"]);

        $stockSudadera = intval($inventario["sudadera"]["stock"]);
        $inventario["sudadera"]["stock"] = $stockSudadera - intval($_REQUEST["sudadera"]);

        $stockZapatillas = intval($inventario["zapatillas"]["stock"]);
        $inventario["zapatillas"]["stock"] = $stockZapatillas - intval($_REQUEST["zapatillas"]);
        */
    }

    if ($_SERVER["REQUEST_METHOD"] == "POST") {
        if (isset($_POST["actualizar"])) {
            // Mostrar resumen antes de confirmar
            echo "<h3>Resumen de pedido:</h3>";

            echo "Camiseta: " . $_REQUEST["camiseta"] . " Unidades <br>";
            echo "Pantalon: " . $_REQUEST["pantalon"] . " Unidades <br>";
            echo "Sudadera: " . $_REQUEST["sudadera"] . " Unidades <br>";
            echo "Zapatillas: " . $_REQUEST["zapatillas"] . " Unidades<br>";
            echo "<br>";

            $precioTotal = ($_REQUEST["camiseta"] * $inventario["camiseta"]["precio"]) + ($_REQUEST["pantalon"] * $inventario["pantalon"]["precio"]) + ($_REQUEST["sudadera"] * $inventario["sudadera"]["precio"]) + ($_REQUEST["zapatillas"] * $inventario["zapatillas"]["precio"]);

            echo "Precio Total: " . $precioTotal;
            echo "<br>";
            echo "<form method=post>";
            echo "<button type=submit name=confirmar >CONFIRMAR PEDIDO</button>";
            echo "</form>";
            echo "<br>";
        }
        if (!isset($_POST['confirmar'])) {
            // si no pulsas el botón de confirmación

            echo '<form action="" method="post">';

            echo '</form>';
        } else {
            // Confirmación final, no volver a mostrar formulario
            echo "<h3>¡Compra realizada!</h3>";
            echo "<button><a href= >Volver a la tienda</a></button>";
            echo "<br>";
        }
    }
    /* 
    echo " ----STOCK---- <br>";
    foreach ($inventario as $producto => $stock) {
        echo $producto . " =>" . $stock["stock"] . "<br>";
    }
    echo " ------------------ <br>";
    */
    file_put_contents(RUTA_FICHERO, serialize($stock));
    ?>


</body>

</html>