<?php
//Aquí creamos un simple conversor de euros a pesetas utilizando un 
//formulario que no usa sesiones ni cookies.

//Explicación: El valor en euros ingresado se convierte a pesetas al 
//hacer clic en el botón. El cálculo es sencillo, y el resultado se 
//muestra en la misma página usando el método GET.
?>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Conversor de Euros a Pesetas</title>
</head>
<body>
    <form action="" method="get">
        <label for="euros">Euros:</label>
        <input type="number" name="euros" id="euros" step="0.01">
        <button type="submit">Convertir</button>
    </form>

    <?php
    if (isset($_GET['euros'])) {
        $euros = $_GET['euros'];
        $pesetas = $euros * 166.386; // Conversión aproximada
        echo "$euros euros son " . number_format($pesetas, 2) . " pesetas.";
    }
    ?>
</body>
</html>
