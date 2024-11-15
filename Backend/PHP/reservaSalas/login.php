<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>login</title>
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
            <button type="submit">Acceder</button>
        </form>

        <a href="index.php">Volver atrás</a>
    </div>

    <?php

    // Verificamos si el formulario fue enviado
    if ($_SERVER["REQUEST_METHOD"] == "POST") {

        // Guardamos los datos que envía el formulario
        $username = $_POST['usuario'];
        $password = $_POST['password'];

        // Verificamos si el archivo existe
        $ruta = "usuarios.json";
        if (file_exists($ruta)) {
            $usuarios = json_decode(file_get_contents($ruta), true);
        } else {
            echo "El fichero no existe";
            exit();
        }

        if (isset($username) && isset($password)) {
            $encontrado = false;

            foreach ($usuarios as $usuario => $detalles) {
                if ($usuario == $username && password_verify($password, $detalles["password"])) {
                    $encontrado = true;
                    echo "Acceso concedido";
                    header("Location: reservas.php");
                    exit; // Detenemos la ejecución después de la redirección
                }
            }

            if (!$encontrado) {
                echo "Usuario o contraseña incorrectos";
            }
        } else {
            echo "Por favor ingresa el usuario y la contraseña";
        }
    }

    ?>

</body>

</html>