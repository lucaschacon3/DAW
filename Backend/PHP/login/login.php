<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
</head>
<body>

    <?php 
        if (isset($_POST["user"])) {
            if ($_POST["user"]=="lucas") {
                
            }
        }

    ?>
    <form action="" method="post">

    <input type="text" name="user" id="user" placeholder="ususario">
    <input type="password" name="user" id="user" placeholder="contraseña">
    
    <button type="submit">Iniciar sesion</button>
    </form>
    
</body>
</html>