<?php
session_start();
include 'funciones.php';
autenticarUsuario();   // Verifica autenticación
verificarAdmin();       // Verifica permisos de administrador

// Aquí va el resto del código de gestión de stock
?>
