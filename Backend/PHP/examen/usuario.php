<?php 

session_start();
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>usuario</title>
</head>
<body>
    <h1>Bienvenido <?php echo $_SESSION["user"];?></h1>
    <form action="" method="post">
        <button type="submit">Cerrar sesion</button>
    </form>

    <?php
    if ($_SERVER["REQUEST_METHOD"]=="POST") {
        session_destroy();
        header("Location: passwd.php");
    }

    ?>
    
</body>
</html>