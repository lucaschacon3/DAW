<?php

$mensajes = isset($_POST['mensajes']) ? $_POST['mensajes'] : '';
$entrada = isset($_POST['entrada']) ? $_POST['entrada'] : '';

if ($entrada !== '') {
    $mensajes .= $entrada . "\n"; 
}
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Blog Fake</title>
</head>
<body>

    <h1>Blog</h1>
    <form method="POST">
        <input type="hidden" name="mensajes" value="<?php echo $mensajes; ?>">
        <input type="text" id="entrada" name="entrada" placeholder="Escribe un mensaje">
        <button type="submit">Enviar</button>
    </form>

    <h3>Menasjes:</h3>
    <textarea rows="10" cols="50"><?php echo $mensajes; ?></textarea>

</body>
</html>
