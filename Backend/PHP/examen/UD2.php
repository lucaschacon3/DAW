<?php
$productos = array('Fresas', 'Platanos', 'Limones');
$MAX_PRODUCTOS = 3;
$TOPE_PRODUCTO = 10;
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>UD2</title>
    <style>
        *{
            margin: 0.3em;
            padding: 0.3em;
        }
    </style>
</head>

<body>
    <p>Cesta de la compra de fruta y verdura:</p>

    <?php

    //mostrar formulario
    echo "<form action='' method='post'>";
    $cont = 1;
    foreach ($productos as $producto) {
        echo "<label for='$producto'>producto $cont</label>";
        echo "<select name='select$cont' id=''>";
        echo "<option value='0' selected></option>";
        echo "<option value='fresas'>fresas</option>";
        echo "<option value='platanos'>platanos</option>";
        echo "<option value='limones'>limones</option>";
        echo "</select>";
        echo "<input type='number' name=$producto id='' value='0' min='0' max=$TOPE_PRODUCTO>";
        echo "<br>";
        $cont++;
    }
    echo "<label for='perejil'> <input type='checkbox' name='perejil' id=''> Añadir perejil?</label>
";
    echo "<button type='submit'>acualizar</button>";
    echo "</form>";

    //logica

    if ($_SERVER["REQUEST_METHOD"] == "POST") {
        echo "<hr>";
        echo  "Resumen: <br>";
        $frutas = [];
        foreach ($productos as $producto) {
            if ($_POST[$producto]!= 0) {
                if ($_POST[$producto]>$TOPE_PRODUCTO) {
                    $_POST[$producto]=10;
                }
                if ($_POST[$producto]<0) {
                    $_POST[$producto]=0;
                }

                echo $producto .": ". $_POST[$producto] . "<br>";
            }
            
        }

        if (isset($_POST["perejil"])) {
            echo "Perejil: SI";
        }else{
            echo "Perejil: No";
        }
        
    }

    ?>
</body>

</html>