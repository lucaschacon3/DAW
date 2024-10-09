<?php
$canciones = ['Canción 1', 'Canción 2', 'Canción 3'];
$busqueda = isset($_GET['busqueda']) ? $_GET['busqueda'] : '';
$encontrados = [];

foreach ($canciones as $cancion) {
    if ($busqueda != '' && strpos($cancion, $busqueda) !== false) {
        $encontrados[] = $cancion;
    }
}
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Buscador de Canciones</title>
</head>
<body>

    <h1>Buscar Canciones</h1>
    <form method="GET">
        <label for="busqueda">Buscar:</label>
        <input type="text" id="busqueda" name="busqueda" value="<?php echo $busqueda; ?>">
        <button type="submit">Buscar</button>
    </form>

    <?php if ($busqueda !== ''): ?>
        <h3>Resultados:</h3>
        <ul>
            <?php if (!empty($encontrados)): ?>
                <?php foreach ($encontrados as $resultado): ?>
                    <li><?php echo $resultado; ?></li>
                <?php endforeach; ?>
            <?php else: ?>
                <p>No se encontró "<?php echo $busqueda; ?>".</p>
            <?php endif; ?>
        </ul>
    <?php endif; ?>

</body>
</html>
