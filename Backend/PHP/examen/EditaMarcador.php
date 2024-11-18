<?php
session_start();



?>
<html>

<head>
    <meta charset="utf-8">
    <title>Editor de marcador</title>
</head>

<body>
    <?php
    include "partidos.inc";
    if (
        !isset($_REQUEST["partido"])
        || ! is_numeric($_REQUEST["partido"])
        || $_REQUEST["partido"] < 0
        || $_REQUEST["partido"] > count($partidos)
    ) {
        echo "Error, partido inválido";
        echo '<p><a href="Marcadores.php">Volver al listado (actualizar antes)</a></p>';
        exit();
    }
    $partido = $_REQUEST["partido"];
    $equipos = explode(":", $partidos[$partido]);
    ?>

    <form method="POST">
        <input type="hidden" name="partido" value="<?= $partido ?>">
        <?= $equipos[0] ?>:<input type=number name="local" value="<?= $_SESSION["partido2"] ?>" />
        <?= $equipos[1] ?>:<input type=number name="visitante" value="<?= $_SESSION["partido1"] ?>" />
        Minuto:<input type="number" name="minuto" value="<?= $_SESSION["minutos"] ?>" />
        <input type="submit" value="Actualizar">
        <p><a href="Marcadores.php">Volver al listado (actualizar antes)</a></p>
    </form>

    <?php
    if ($_SERVER['REQUEST_METHOD'] == "POST") {
        if (!isset($_POST["partido"])) {
            $_SESSION["partido1"] = "0";
            $_SESSION["partido2"] = "0";
            $_SESSION["minutos"] = "0";
            echo "Sin actualizar <br>";
        }else{
            foreach ($partidos as $partido) {

                $partidillo = explode(":", $partido);
                if (isset($_POST[$partidillo[0]]) ||  isset($_POST[$partidillo[1]])) {
                    $_POST[$partidillo[0]] = 0;
                    $_POST[$partidillo[1]] = 0;
                } else {
                    $_SESSION["partidos1"] = [
                        $partidillo[0] => $_POST[$partidillo[0]],
                        $partidillo[1] => $_POST[$partidillo[1]]
                    ];
                }
            }
            echo "Actualizado correctamente <br>";
        }

    }
    
    ?>
</body>

</html>