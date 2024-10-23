
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Bienvenido</title>
    <style>
        *{
            padding: 0.3em;
            margin: 0.3em;
        }
        div{
            margin: auto;
            text-align: center;
            border: solid 1px;
            height: 300px;
            width: 300px;
        }

    
    </style>
</head>
<body>
    <div>
    <form action="carritoCompra.php" method="get">
        <h2>Inicio sesion</h2>
        <br>
        <input type="text" placeholder="Usuario" name="nombre">
        <input type="password" placeholder="Contraseña">
        <br><br><br>
        <button type="submit"> Iniciar sesion</button>
    </form>
    </div>

    
</body>
</html>