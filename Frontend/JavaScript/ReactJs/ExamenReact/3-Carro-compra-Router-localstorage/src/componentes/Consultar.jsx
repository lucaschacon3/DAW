import React from "react";

const AficionConsultar = ({ productos }) => {
  return (
    <div>
      {productos.length > 0 ? (
        <ul className="lista-productos">
          {productos.map((producto, index) => (
            <li key={index} className="producto-item">
              <span>
                {producto.cantidad} x {producto.nombre}
              </span>
            </li>
          ))}
        </ul>
      ) : (
        <p>No hay productos en el carrito.</p>
      )}
    </div>
  );
};

export default AficionConsultar;
