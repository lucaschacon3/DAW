<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Carrito</title>
</head>

<body>
    <form action="" method="post">

        <?php

        $precio = [
            "pera" => 2.5,
            "manzana" => 2.5,
            "platano" => 2.5,
            "kiwi" => 2.5
        ];

        define('RUTA_FICHERO', "stock.data");

        if (file_exists(RUTA_FICHERO)) {
            $contenido = file_get_contents(RUTA_FICHERO);
            $stock = unserialize($contenido);
        } else {
            $stock = [
                "pera" => 10,
                "manzana" => 3,
                "platano" => 15,
                "kiwi" => 2
            ];
            file_put_contents(RUTA_FICHERO, serialize($stock));
        }

        foreach ($precio as $producto => $valor) {
            echo "<label for=\"$producto\">$producto</label>";// barra / de escape
            echo "<input type=\"number\" name=\"$producto\">";
            echo " Precio: $valor, Stock: {$stock[$producto]}<br>";
        };
        echo "";

        if (($_REQUEST["POST"])) {
            $stock["pera"]= $stock["pera"]-$_REQUEST["pera"];
            $stock["manzana"]= $stock["manzana"]-$_REQUEST["manzana"];
            $stock["platano"]= $stock["platano"]-$_REQUEST["platano"];
            $stock["kiwi"]= $stock["kiwi"]-$_REQUEST["kiwi"];
        }


        ?>
        <button type="submit">ENVIAR</button>
    </form>

    <?php
    file_put_contents(RUTA_FICHERO, serialize($stock));
    ?>

</body>

</html>