<?php

$multiplicacion = 166.386;
$euros = isset($_POST['euros']) ? $_POST['euros'] : '';
$pesetas = '';

if ($euros !== '' && is_numeric($euros)) {
    $pesetas = $euros * $multiplicacion;
}
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>De Euros a Pesetas</title>
</head>
<body>

    <h2>Conversor de Euros a Pesetas</h2>
    <form method="POST">
        <label for="euros">Euros:</label>
        <input type="text" id="euros" name="euros" value="<?php echo $euros; ?>">
        <button type="submit">Convertir</button>
    </form>

    <?php if ($pesetas !== ''): ?>
        <p><?php echo $euros; ?> euros son <?php echo $pesetas; ?> pesetas.</p>
    <?php endif; ?>

</body>
</html>
