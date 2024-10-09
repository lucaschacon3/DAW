<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ADIVINA UN NÚMERO Mario</title>
</head>
<body>

    <form action="" method="POST">
        <label for="num">He elegido un número, pon un número e intenta adivinarlo</label>
        <input type="number" id="num" name="num" required><br><br>
        <input type="hidden" name="num_random" value="<?php echo isset($_POST['num_random']) ? $_POST['num_random'] : rand(1, 10); ?>">
        <input type="submit" value="Enviar">
    </form>
    
    <?php 
    $num_random = isset($_POST['num_random']) ? $_POST['num_random'] : rand(1, 10); 
    $num = isset($_POST['num']) ? $_POST['num'] : '';
    if (!empty($num)) {
        if ($num_random > $num) {
            echo "<br>" . $num . " es MENOR al número que he elegido.";
        } elseif ($num_random < $num) {
            echo "<br>" . $num . " es MAYOR al número que he elegido.";
        } else {
            echo "<br>" . $num . " era el número que he elegido. ¡ENHORABUENA!";  
            echo '<form action="" method="GET">
                    <input type="hidden" name="num_random" value="' . rand(1, 10) . '">
                    <input type="submit" value="Reiniciar juego">
                  </form>';
        }
    } else {
        echo "<br>" . "Por favor, pon un número.";  
    }
    ?>
</body>
</html>
