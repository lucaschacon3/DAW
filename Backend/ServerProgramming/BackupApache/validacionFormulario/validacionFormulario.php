<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Validación Formulario</title>
</head>
<body>

<form action="" method="post">

    <div>
        <label for="nombre">Nombre: </label>
        <input type="text" name="nombre" id="nombre">
    </div>
    
    <div>
        <label>Edad: </label>
        <br>

        <label for="mas18">Mayor de 18</label>
        <input type="radio" name="edad" id="mas18" value="mayor">

        <label for="menos18">Menor de 18</label>
        <input type="radio" name="edad" id="menos18" value="menor">
    </div>

    <div>
        <label>Asignaturas: </label>
        
        <input type="checkbox" name="asignaturas[]" id="DAW" value="DAW">
        <label for="DAW">DAW</label>

        <input type="checkbox" name="asignaturas[]" id="DWES" value="DWES">
        <label for="DWES">DWES</label>

        <input type="checkbox" name="asignaturas[]" id="DIW" value="DIW">
        <label for="DIW">DIW</label>

        <input type="checkbox" name="asignaturas[]" id="DWEC" value="DWEC">
        <label for="DWEC">DWEC</label>
    </div>

    <div>
        <label for="instituto">Instituto</label>
        <select name="instituto" id="instituto">
            <option value="goya">IES Goya</option>
            <option value="barajas">IES Barajas</option>
            <option value="quevedo">IES Quevedo</option>
            <option value="bilbao">IES Bilbao</option>
        </select>
    </div>

</form>
    
</body>
</html>
