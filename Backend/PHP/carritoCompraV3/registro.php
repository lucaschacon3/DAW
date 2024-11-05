<?php
include 'funciones.php';

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $username = $_POST['username'];
    $password = $_POST['password'];
    $role = $_POST['role'];

    // Conectar a la base de datos
    $pdo = conectarBD();

    // Verificar si el usuario ya existe
    $stmt = $pdo->prepare("SELECT * FROM usuarios WHERE username = :username");
    $stmt->execute(['username' => $username]);
    if ($stmt->rowCount() > 0) {
        echo "El usuario ya existe.";
    } else {
        // Agregar nuevo usuario con contraseña hasheada
        $stmt = $pdo->prepare("INSERT INTO usuarios (username, password, role) VALUES (:username, :password, :role)");
        $stmt->execute([
            'username' => $username,
            'password' => password_hash($password, PASSWORD_DEFAULT),
            'role' => $role
        ]);
        echo "Usuario registrado con éxito.";
    }
}

?>

<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <title>Registro</title>
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
    <form method="post">
        <div>
            <input type="text" name="username" placeholder="Usuario">
            <br>
            <input type="password" name="password" placeholder="Contraseña">
            <br>
            <label>Rol:
                <select name="role">
                    <option value="user">Usuario</option>
                    <option value="admin">Administrador</option>
                </select>
            </label><br><br><br>
            <button type="submit">Registrarse</button>
    </form>
    <br><br><br>
    <a href="index.html">Volver al inicio</a>
    </div>

</body>

</html>