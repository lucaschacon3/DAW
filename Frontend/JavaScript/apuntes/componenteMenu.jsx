/**
 * Componente hijo de App.jsx
 */

//importamos estilos
import "../estilos/menu.css";

import React, { useState } from "react";

// Componente MenuSuperior que recibe 2 parámetros
const MenuSuperior = ({ total, productos }) => {
  // ZONA VARIABLES
  //const nombreVariable [variable, setVariable]=useState("valor-inicial")
  const [carritoVisible, setCarritoVisible] = useState(false);
  const toggleCarrito = () => {
    setCarritoVisible(!carritoVisible);
  };

  return (
    <>
      <div>
        {/* Icono a la izquierda */}
        <img
          src="/img/supermercado.png"
          alt="Supermercado"
          className="icono-supermercado"
        />

        {/* Texto a la derecha */}
        <span>
          {productos.length} : {total}Є
        </span>

        {/* Botón para mostrar/ocultar carrito */}
        <button onClick={toggleCarrito}>🛒</button>

        {/* Carrito de productos */}
        {carritoVisible && (
          <div>
            <h4>Carrito</h4>
            {productos.length > 0 ? (
              <ul>
                {productos.map((producto, index) => (
                  <li key={index}>{producto}</li>
                ))}
              </ul>
            ) : (
              <p>No hay productos en el carrito.</p>
            )}
          </div>
        )}
      </div>
    </>
  );
};

export default MenuSuperior;
