<?php
session_start();

function conectarBD() {
    $host = 'localhost'; 
    $dbname = 'dwes1';
    $user = 'daw2'; 
    $pass = 'LaElipa'; 

    try {
        $pdo = new PDO("mysql:host=$host;dbname=$dbname;charset=utf8", $user, $pass);
        $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        return $pdo;
    } catch (PDOException $e) {
        echo "Error de conexión: " . $e->getMessage();
        exit();
    }
}


// Función para inicializar el inventario y el estado del usuario
function inicializar() {
    $filePath = 'stock.json';
    
    // Cargar inventario desde el archivo stock.json
    if (file_exists($filePath)) {
        $inventario = json_decode(file_get_contents($filePath), true);
    } else {
        echo "Error: el archivo de inventario no existe.";
        exit();
    }

    // Verificar si el usuario es admin
    $isAdmin = verificarAdmin();
    $carrito = []; // Variable global para el carrito

    return [$inventario, $isAdmin, $carrito];
}

// Función para mostrar el formulario de productos o de administración
function mostrarFormulario($isAdmin, $inventario) {
    if ($isAdmin) {
        echo "<h3>Editar inventario:</h3>";
        foreach ($inventario as $producto => $datos) {
            echo "<label>" . ucfirst($producto) . ": </label>";
            echo "Precio: <input type='number' name='{$producto}_precio' value='" . htmlspecialchars($datos["precio"]) . "' step='0.01'> ";
            echo "Stock: <input type='number' name='{$producto}_stock' value='" . htmlspecialchars($datos["stock"]) . "' min='0'><br>";
        }
        echo "<button type='submit' name='actualizar_admin'>Actualizar Inventario</button>";
    } else {
        echo "<h3>Selecciona productos:</h3>";
        foreach ($inventario as $producto => $datos) {
            echo "<label for='{$producto}'>" . ucfirst($producto) . ": </label>";
            echo "<input type='number' name='{$producto}' id='{$producto}' value='0' min='0'> ";
            echo $datos["precio"] . " € | Stock: " . $datos["stock"] . "<br>";
        }
        echo "<button type='submit' name='actualizar'>Actualizar Carrito</button>";
    }
}

// Función para procesar la solicitud y manejar inventario y pedidos
function procesarSolicitud($isAdmin, &$inventario, &$carrito) {
    if ($_SERVER["REQUEST_METHOD"] == "POST") {
        if ($isAdmin && isset($_POST["actualizar_admin"])) {
            foreach ($inventario as $producto => $datos) {
                if (isset($_POST["{$producto}_precio"]) && isset($_POST["{$producto}_stock"])) {
                    $inventario[$producto]["precio"] = floatval($_POST["{$producto}_precio"]);
                    $inventario[$producto]["stock"] = intval($_POST["{$producto}_stock"]);
                }
            }
            actualizarInventario($inventario);
        } elseif (!$isAdmin && isset($_POST["actualizar"])) {
            procesarPedidoCliente($inventario, $carrito);
        } elseif (isset($_POST['confirmar']) && !$isAdmin) {
            confirmarCompra($inventario, $carrito);
        }
    }
}

// Función para actualizar inventario en el archivo JSON
function actualizarInventario($inventario) {
    $filePath = 'stock.json';
    if (file_put_contents($filePath, json_encode($inventario, JSON_PRETTY_PRINT))) {
        echo "<h3>Inventario actualizado correctamente <button><a href=''>Aceptar</a></button></h3>";
    } else {
        echo "<p style='color:red;'>Error al guardar los cambios en el archivo.</p>";
    }
}

function procesarPedidoCliente($inventario, &$carrito) {
    echo "<h3>Resumen de pedido:</h3>";
    $precioTotal = 0;
    $pedidoValido = true;

    foreach ($inventario as $producto => $datos) {
        $cantidad = intval($_POST[$producto]);
        if ($cantidad > $datos["stock"]) {
            echo "Lo siento, no hay suficiente stock para " . ucfirst($producto) . ".<br>";
            $pedidoValido = false;
        } elseif ($cantidad > 0) {
            $carrito[$producto] = $cantidad;
            $precioTotal += $cantidad * $datos["precio"];
            echo ucfirst($producto) . ": " . $cantidad . " Unidades <br>";
        }
    }

    echo "<br>Precio Total: " . $precioTotal . " €<br>";

    if ($pedidoValido) {
        echo "<form method='post'>";
        
        // Agregar inputs ocultos para cada producto en el carrito
        foreach ($carrito as $producto => $cantidad) {
            echo "<input type='hidden' name='carrito[{$producto}]' value='{$cantidad}'>";
        }

        echo "<button type='submit' name='confirmar'>CONFIRMAR PEDIDO</button>";
        echo "</form><br>";
    } else {
        echo "<p style='color:red;'>Por favor, ajusta las cantidades.</p>";
    }
}

function confirmarCompra(&$inventario, $carrito) {
    foreach ($_POST['carrito'] as $producto => $cantidad) {
        $inventario[$producto]["stock"] -= $cantidad;
    }
    actualizarInventario($inventario);
    echo "<h3>¡Compra realizada y stock actualizado!</h3>";
}

function cargarUsuarios() {
    $pdo = conectarBD();
    $stmt = $pdo->query("SELECT username, password, role FROM usuarios");
    return $stmt->fetchAll(PDO::FETCH_ASSOC);
}


// Verificar si el usuario está autenticado
function autenticarUsuario() {
    if (!isset($_SESSION['username'])) {
        header("Location: login.php");
        exit();
    }
}

// Verificar si el usuario tiene rol de administrador
function verificarAdmin() {
    // Comprueba si la sesión está iniciada y si el rol es 'admin'
    if (isset($_SESSION['role']) && $_SESSION['role'] === 'admin') {
        return true; // El usuario es administrador
    }
    return false; // El usuario no es administrador
}
?>
