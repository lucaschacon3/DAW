<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registro</title>
    <style>
        * {
            padding: 0.5em;
            margin: 0.5em;
        }

        div {
            border: 1px solid #000;
            margin: auto;
            height: 300px;
            width: 300px;
            text-align: center;
        }

        button {
            border: 1px solid #000;
            height: 30px;
            width: 120px;
        }
    </style>

</head>

<body>
    <div>
        <form action="" method="post">
            <input type="text" name="usuario" id="usuario" placeholder="Usuario">
            <input type="text" name="password" id="password" placeholder="Contraseña">
            <select name="rol" id="rol">
                <option value="usuario" selected>Usuario</option>
                <option value="admin">Admin</option>
            </select>
            <button type="submit">Registrarse</button>
        </form>

        <a href="index.php">Volver atrás</a>
    </div>

    <?php
    // Verificamos si el formulario fue enviado
    if ($_SERVER['REQUEST_METHOD'] == 'POST') {

        // Guardamos los datos que envía el formulario
        $username = $_POST['usuario'];
        $password = $_POST['password'];
        $rol = $_POST['rol'];

        // Verificamos si el archivo existe
        $ruta = "usuarios.json";
        if (file_exists($ruta)) {
            $usuarios = json_decode(file_get_contents($ruta), true);
        } else {
            echo "El fichero no existe";
            exit();
        }

        // Verificar si el usuario ya existe
        $existe = false;
        foreach ($usuarios as $usuario => $detalles) {
            if ($usuario == $username) {
                echo "El usuario ya existe.";
                $existe = true;
                break; // Terminamos el bucle si ya encontramos el usuario
            }
        }

        // Agregar nuevo usuario con contraseña hasheada si no existe
        if (!$existe) {
            // Añadimos el nuevo usuario con la contraseña hasheada
            $usuarios[$username] = [
                "password" => password_hash($password, PASSWORD_DEFAULT),
                "rol" => $rol
            ];

            // Guardamos el nuevo usuario en usuarios.json
            if (file_put_contents($ruta, json_encode($usuarios, JSON_PRETTY_PRINT))) {
                echo "Usuario registrado con éxito.";
            } else {
                echo "Hubo un error al guardar el usuario.";
            }
        }
    }
    ?>

</body>

</html>