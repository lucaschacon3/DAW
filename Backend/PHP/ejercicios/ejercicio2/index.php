<?php 

include 'funciones.php';
iniciarSesion();

?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ej2</title>
    <style>
        div {
            padding: 0.5em;
            border: solid 2px black;
            height: 200px;
            width: 700px;
            margin: auto;
            text-align: center;
        }
    </style>
</head>

<body>

    <?php mostrarFormulario() ?>

</body>

<?php 
ganar();
traza();

?>

</html>