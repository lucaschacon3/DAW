import React, { useState } from "react";
import "../estilos/menu.css";
import { Link } from "react-router-dom";
import { obtenerCantidadTotal } from "../herramientas/buscarProducto";

// Componente MenuSuperior
const Menu = ({ total,setTotal, productosJson, setProductosJson }) => {
  const [carritoVisible, setCarritoVisible] = useState(false);

  const toggleCarrito = () => {
    setCarritoVisible(!carritoVisible);
  };

  // Función para eliminar un producto por su nombre (puedes cambiarla para usar un id único)
  const eliminarProducto = (nombreProducto) => {
    // Filtrar el producto a eliminar
    const nuevosProductos = productosJson.filter((c) => c.nombre !== nombreProducto);
    
    // Calcular el nuevo total sumando los precios de los productos restantes
    const nuevoTotal = nuevosProductos.reduce((acc, producto) => acc + producto.precio * producto.cantidad, 0);
  
    // Actualizar el estado con los nuevos productos y el nuevo total
    setProductosJson(nuevosProductos);
    setTotal(nuevoTotal);
  };
  

  return (
    <div className="menu-superior">
      {/* Icono a la izquierda */}
      <img
        src="/imagenes/supermercado.png"
        alt="Supermercado"
        className="icono-supermercado"
      />
      <Link to="/"> Inicio</Link>
      <Link to="/detalle-carrito"> Detalle</Link>
      {/* Texto a la derecha */}
      <span className="carrito-texto">
        {obtenerCantidadTotal(productosJson)} : {total}Є
      </span>

      {/* Botón para mostrar/ocultar carrito */}
      <button className="toggle-carrito" onClick={toggleCarrito}>
        🛒
      </button>

      {/* Carrito de productos */}
      {carritoVisible && (
        <div className="carrito-productos">
          <h4>Carrito</h4>
          {productosJson.length > 0 ? (
            <ul>
              {productosJson.map((producto, index) => (
                <li key={index}>
                  {producto.nombre}:{producto.cantidad}{" "}
                  <button onClick={() => eliminarProducto(producto.nombre)}>
                    Eliminar
                  </button>
                </li>
              ))}
            </ul>
          ) : (
            <p>No hay productos en el carrito.</p>
          )}
        </div>
      )}
    </div>
  );
};

export default Menu;
