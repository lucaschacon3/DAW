<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>registro</title>
</head>

<body>
    <form action="" method="post">
        <h1>Registro</h1>
        <input type="text" name="usuario" id="" placeholder="Usuario">
        <input type="password" name="password" id="" placeholder="Contraseña">
        <select name="rol" id="">
            <option value="usuario" selected>Usuario</option>
            <option value="admin">Administrador</option>
        </select>

        <button type="submit">Registrarse</button>
    </form>
    <a href="index.php">Volver atrás</a>

    <?php 

    if ($_SERVER["REQUEST_METHOD"]=="POST") {
        if (($_POST["usuario"])=="" || ($_POST["password"])=="") {
            echo "Intoduce un usuario y contraseña";
        }else{
            $username=$_POST["usuario"];
            $password=$_POST["password"];
            $rol=$_POST["rol"];

            $ruta="usuarios.json";

        if (file_exists($ruta)) {
            $usuarios=json_decode(file_get_contents($ruta),true);
        }else{
            echo "El fichero no existe";
            exit();
        }

        $encontrado=false;

        foreach($usuarios as $usuario => $detalles){
            if ($usuario==$username) {
                echo "El usuario ya existe";
                $encontado=true;

            }
        }

        if (!$encontado) {
            $usuarios[$username]=[
                "password"=> password_hash($password, PASSWORD_DEFAULT),
                "rol"=> $rol
            ];
            if (file_put_contents($ruta,json_encode($usuarios, JSON_PRETTY_PRINT))) {
                echo "Se ha registrado con éxito";
            }else{
                echo "Ha ocurrido un problema";
            }
            
        }
        }
    }
    ?>
</body>

</html>