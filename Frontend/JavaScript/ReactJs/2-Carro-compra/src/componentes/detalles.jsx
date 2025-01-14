import React, { useState } from "react";
import "../estilos/pagina404.css";

// Componente MenuSuperior
const MenuSuperior = ({ total, productos }) => {
  const [carritoVisible, setCarritoVisible] = useState(false);

  const toggleCarrito = () => {
    setCarritoVisible(!carritoVisible);
  };

  return (
    <div className="pagina404">
      <h1>Detalles</h1>
    </div>
  );
};

export default MenuSuperior;
