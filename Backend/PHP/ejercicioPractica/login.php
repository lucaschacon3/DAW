<?php
session_start();
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>login</title>
</head>

<body>
    <form action="" method="post">
        <h1>Iniciar sesion</h1>
        <input type="text" name="usuario" id="" placeholder="Usuario">
        <input type="password" name="password" id="" placeholder="Contraseña">

        <button type="submit">Acceder</button>
    </form>
    <a href="index.php">Volver atrás</a>

    <?php 

    if ($_SERVER["REQUEST_METHOD"]=="POST") {
        if (($_POST["usuario"])=="" || ($_POST["password"])=="") {
            echo "Intoduce un usuario y contraseña";
        }else{
            $username=$_POST["usuario"];
            $password=$_POST["password"];

            $ruta="usuarios.json";

        if (file_exists($ruta)) {
            $usuarios=json_decode(file_get_contents($ruta),true);
        }else{
            echo "El fichero no existe";
            exit();
        }

        $encontrado=false;

        foreach($usuarios as $usuario => $detalles){
            if ($usuario==$username && password_verify($password, $detalles["password"])) {
                echo "Correcto";
                $encontado=true;
                $_SESSION["usuario"]=$usuario;
                $_SESSION["rol"]= $detalles["rol"];
                header('Location: aplicacion.php');
                
            }
        }

        if (!$encontado) {
            echo "Usuario y/o contraseña incorrecto";
            
        }
        }
    }
    ?>
</body>

</html>