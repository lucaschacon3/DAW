<?php 
echo "Datos introducidos:". "<br>";
echo "Usuario: ".$_REQUEST["usuario"] . "<br>";
echo "Correo: ".$_REQUEST["correo"]. "<br>";
echo "Contraseña: ".$_REQUEST["contraseña"]. "<br>";
$alergias = $_REQUEST["alergias"] ?? "off";
echo "Alergias: ".$alergias . "<br>";
?>
