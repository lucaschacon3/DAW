<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Formulario con Confirmación</title>
    <style>
        .error {
            color: red;
        }

        .hidden {
            display: none;
        }

        div {
            border: solid 2px;
            padding: 1em;
            margin: auto;
            height: 470px;
            width: 500px;
        }

        button{
            height: 40px;
            width: 100px;
        }

    </style>
</head>

<body>

    <?php
    // Función para obtener valores previos o por defecto
    function si_existe($clave, $valorPorDefecto = '')
    {
        return isset($_REQUEST[$clave]) ? $_REQUEST[$clave] : $valorPorDefecto;
    }

    // Funciones de validación
    function validarNombre($campo)
    {
        $valor = si_existe($campo);
        if (empty($valor)) return "El nombre no puede estar vacío.";
        if (strlen($valor) < 3 || strlen($valor) > 20) return "El nombre debe tener entre 3 y 20 caracteres.";
        return '';
    }

    function validarEdad($campo)
    {
        if (!isset($_REQUEST[$campo])) return "Debe seleccionar si tiene más de 18 años.";
        return '';
    }

    function validarDeportes($campo)
    {
        if (!isset($_REQUEST[$campo])) return "Debe seleccionar al menos un deporte.";
        return '';
    }

    function validarDias($campo)
    {
        if (!isset($_REQUEST[$campo]) || count($_REQUEST[$campo]) < 2) return "Debe seleccionar al menos dos días de la semana.";
        return '';
    }

    // Validación de formulario
    $errores = [];
    $etapaConfirmacion = false;

    if ($_SERVER['REQUEST_METHOD'] == 'POST') {
        if (isset($_POST['confirmar'])) {
            // Si estamos en la etapa de confirmación final
            $etapaConfirmacion = true;
        } else {
            // Validar los datos en la primera etapa
            $errores['nombre'] = validarNombre('nombre');
            $errores['edad'] = validarEdad('edad');
            $errores['deportes'] = validarDeportes('deportes');
            $errores['dias'] = validarDias('diasSemana');

            $errores = array_filter($errores); // Eliminar errores vacíos

            // Si no hay errores, pasar a la etapa de confirmación
            if (empty($errores)) {
                $etapaConfirmacion = true;
            }
        }
    }

    // Mostrar mensaje de cabeceras y datos del servidor
    echo "<h3>Datos del servidor</h3>";
    echo "IP remota: " . $_SERVER['REMOTE_ADDR'] . "<br>";
    echo "Navegador: " . $_SERVER['HTTP_USER_AGENT'] . "<br>";
    $headers = apache_request_headers();
    echo "Host: " . $headers['Host'] . "<br>";
    echo " <hr>";

    if (!$etapaConfirmacion) {
    ?>
    <div>
        <form method="post" action="">

            <label for="nombre">Nombre (entre 3 y 20 caracteres):</label><br>
            <input type="text" name="nombre" value="<?= si_existe('nombre') ?>"><br>
            <span class="error"><?= $errores['nombre'] ?? '' ?></span><br><br>

            <label>¿Tienes más de 18 años?</label><br>
            <input type="radio" name="edad" value="si" <?= si_existe('edad') == 'si' ? 'checked' : '' ?>> Sí<br>
            <input type="radio" name="edad" value="no" <?= si_existe('edad') == 'no' ? 'checked' : '' ?>> No<br>
            <span class="error"><?= $errores['edad'] ?? '' ?></span><br><br>

            <label>Deportes (seleccione al menos uno):</label><br>
            <input type="checkbox" name="deportes[]" value="Fútbol" <?= in_array('Fútbol', si_existe('deportes', [])) ? 'checked' : '' ?>> Fútbol<br>
            <input type="checkbox" name="deportes[]" value="Baloncesto" <?= in_array('Baloncesto', si_existe('deportes', [])) ? 'checked' : '' ?>> Baloncesto<br>
            <input type="checkbox" name="deportes[]" value="Tenis" <?= in_array('Tenis', si_existe('deportes', [])) ? 'checked' : '' ?>> Tenis<br>
            <input type="checkbox" name="deportes[]" value="Natación" <?= in_array('Natación', si_existe('deportes', [])) ? 'checked' : '' ?>> Natación<br>
            <span class="error"><?= $errores['deportes'] ?? '' ?></span><br><br>

            <label>Días de la semana (seleccione al menos dos):</label><br>
            <select name="diasSemana[]" multiple>
                <option value="Lunes" <?= in_array('Lunes', si_existe('diasSemana', [])) ? 'selected' : '' ?>>Lunes</option>
                <option value="Martes" <?= in_array('Martes', si_existe('diasSemana', [])) ? 'selected' : '' ?>>Martes</option>
                <option value="Miércoles" <?= in_array('Miércoles', si_existe('diasSemana', [])) ? 'selected' : '' ?>>Miércoles</option>
                <option value="Jueves" <?= in_array('Jueves', si_existe('diasSemana', [])) ? 'selected' : '' ?>>Jueves</option>
                <option value="Viernes" <?= in_array('Viernes', si_existe('diasSemana', [])) ? 'selected' : '' ?>>Viernes</option>
                <option value="Sábado" <?= in_array('Sábado', si_existe('diasSemana', [])) ? 'selected' : '' ?>>Sábado</option>
                <option value="Domingo" <?= in_array('Domingo', si_existe('diasSemana', [])) ? 'selected' : '' ?>>Domingo</option>
            </select><br>
            <span class="error"><?= $errores['dias'] ?? '' ?></span><br><br>

            <button type="submit">Enviar</button>
            <button type="reset">Borrar</button>
        </form>
        </div>

    <?php
    } else {
        // Mostrar resumen antes de confirmar
        echo "<h3>Resumen de datos:</h3>";
        echo "Nombre: " . si_existe('nombre') . "<br>";
        echo "Mayor de 18: " . si_existe('edad') . "<br>";
        echo "Deportes seleccionados: " . implode(', ', si_existe('deportes', [])) . "<br>";
        echo "Días seleccionados: " . implode(', ', si_existe('diasSemana', [])) . "<br>";

        if (!isset($_POST['confirmar'])) {
            // Mostrar el botón de confirmación
            echo '<form method="post">';
            echo '<input type="hidden" name="nombre" value="' . si_existe('nombre') . '">';
            echo '<input type="hidden" name="edad" value="' . si_existe('edad') . '">';
            echo '<input type="hidden" name="deportes[]" value="' . implode(',', si_existe('deportes', [])) . '">';
            echo '<input type="hidden" name="diasSemana[]" value="' . implode(',', si_existe('diasSemana', [])) . '">';
            echo "<br><hr>";
            echo '<button type="submit" name="confirmar">Confirmar datos</button>';
            echo '</form>';
        } else {
            // Confirmación final, no volver a mostrar formulario
            echo "<h3>¡Datos confirmados correctamente!</h3>";
            echo '<a href="">Empezar desde cero</a>';
        }
    }
    ?>

</body>

</html>