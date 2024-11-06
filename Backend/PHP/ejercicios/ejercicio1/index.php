<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ej1</title>
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
    <form action="" method="post">
        <div>
            <label for="nombre">Nombre:</label>
            <input type="text" name="nombre" id="">

            <label for="nivel">Nivel:</label>
            <input type="text" name="nivel" id="">

            <label for="deporte">Deporte:</label>
            <select name="deporte" id="">
                <option value="futbol">futbol</option>
                <option value="futbol">baloncesto</option>
                <option value="futbol">voley</option>
            </select>

            <br><br>
            <label for="liga">Liga:</label><br>

            <input type="radio" name="liga" id="">Mixta</input><br>
            <input type="radio" name="liga" id="">Masculina</input><br>
            <input type="radio" name="liga" id="">Femenina</input><br>

            <br>
            <input type="checkbox" name="aceptar" id="">Aceptar Política</input>
            <br><br>
            <button type="submit">Enviar</button>
        </div>
        

    </form>
</body>

</html>