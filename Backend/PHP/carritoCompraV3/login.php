<?php
session_start(); // Iniciar la sesión al comienzo
include 'funciones.php';

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $username = $_POST['username'];
    $password = $_POST['password'];

    // Conectar a la base de datos
    $pdo = conectarBD();

    // Verificar si el usuario existe y la contraseña es correcta
    $stmt = $pdo->prepare("SELECT * FROM usuarios WHERE username = :username");
    $stmt->execute(['username' => $username]);
    $usuario = $stmt->fetch(PDO::FETCH_ASSOC);

    if ($usuario && password_verify($password, $usuario["password"])) {
        $_SESSION['username'] = $username;
        $_SESSION['role'] = $usuario['role'];
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
        * { padding: 0.3em; margin: 0.3em; }
        div { margin: auto; text-align: center; border: solid 1px; height: 300px; width: 300px; }
    </style>
</head>
<body>
    <div>
        <!-- El action se deja vacío para enviar el formulario a esta misma página -->
        <form method="post" action="">
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
