<?php
session_start();
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Aplicacion</title>
</head>

<body>
    <h1>Bienvenido <?php echo $_SESSION["usuario"]; ?></h1>

    <?php

    if ($_SESSION["rol"]=="admin") {
        echo "Eres admin";


    }else{
        echo "Eres usuario <br><br>";
        $ruta="stock.json";
        if (file_exists($ruta)) {
            $frutas= json_decode(file_get_contents($ruta),true);
        }else{
            echo "Fichero no encontrado";
            exit();
        }

        echo "<form action='' method='post'>";
        foreach($frutas as $fruta => $detalles){
            echo "<label for='$fruta'>$fruta: </label>";
            echo "<input type='number' name='$fruta' value='0' min='0'>";
            echo " Precio: $detalles[precio]";
            echo " Stock: $detalles[stock]";
            echo "<br><br>";
        }
        echo "<button type='submit'>Comprar</button>";
        echo "</form>";

        

        if ($_SERVER["REQUEST_METHOD"]=="POST") {

            $carrito=[];
            foreach($frutas as $fruta => $detalles){
                $carrito[$fruta]= $_POST[$fruta];
            }
            foreach($frutas as $fruta => &$detalles){
                $detalles["stock"]=intval($detalles["stock"])-$carrito[$fruta];
                echo $detalles["stock"]."<br>";
                
            }

            if (file_put_contents($ruta, json_encode($frutas, JSON_PRETTY_PRINT))){
                echo "se cargo correctamente";
            }else{
                echo "no se cargo correctamente";
            }
            echo"<a href=''>actualizar</a>";


        }
    }
    

    ?>

</body>

</html>