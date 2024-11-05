<?php
session_start();
include 'funciones.php';

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $username = $_POST['username'];
    $password = $_POST['password'];

    // Cargar usuarios
    $usuarios = cargarUsuarios();

    // Verificar si el usuario existe y la contraseña es correcta
    if (isset($usuarios[$username]) && password_verify($password, $usuarios[$username]["password"])) {
        $_SESSION['username'] = $username;
        $_SESSION['role'] = $usuarios[$username]['role'];
        header("Location: carrito.php");
        exit();
    } else {
        echo "Usuario o contraseña incorrectos.";
    }
}
?>

<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <title>Login</title>
    <style>
        * {
            padding: 0.3em;
            margin: 0.3em;
        }

        div {
            margin: auto;
            text-align: center;
            border: solid 1px;
            height: 300px;
            width: 300px;
        }
    </style>
</head>

<body>
    <div>
        <form method="post" action="carrito.php">
            <input type="text" name="username" placeholder="Usuario">
            <br>
            <input type="password" name="password" placeholder="Contraseña">
            <br><br><br>
            <button type="submit">Iniciar sesión</button>
        </form>
        <br><br>
        <a href="index.html">Volver al inicio</a>
    </div>

</body>

</html>