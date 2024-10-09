<?php

$mensajes = isset($_POST['mensajes']) ? $_POST['mensajes'] : '';
$entrada = isset($_POST['entrada']) ? $_POST['entrada'] : '';

if ($entrada !== '') {
    $mensajes .= $entrada . "|";
}

$mensajes_array = explode("|", $mensajes);
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Blog Fake (Avanzado)</title>
</head>
<body>

    <h1>Blog</h1>
    <form method="POST">
        <input type="text" id="entrada" name="entrada" placeholder="Escribe tu mensaje">
        <input type="hidden" name="mensajes" value="<?php echo $mensajes; ?>">
        <button type="submit">Enviar</button>
    </form>

    <h3>Mensajes:</h3>

    <div>

        <?php foreach ($mensajes_array as $msg): ?>

            <?php if ($msg !== ''): ?>
                <p><?php echo $msg; ?></p>
            <?php endif; ?>

        <?php endforeach; ?>

    </div>

</body>
</html>
