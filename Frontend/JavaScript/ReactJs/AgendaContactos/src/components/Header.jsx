import React from "react";
import { useState } from "react";
const Header = ({ contactos }) => {
  const [usuarioVisible, setUsuarioVisible] = useState(false);

  const toggleUsuario = () => {
    setUsuarioVisible(!usuarioVisible);
  };

  const nContactos = contactos.length

  return (
    <div className="header">
      <div className="n-contactos">
        <h2>Nº de contactos: {nContactos}</h2>
      </div>
      
      <div className="usuario" onClick={toggleUsuario}>
        <img
          src="https://img.icons8.com/?size=100&id=42384&format=png&color=FFFFFF"
          alt="Imagen"
          width={50}
        />
        <h3>Lucas Chacon</h3>
      </div>

      {usuarioVisible && (
        <div className="toggle-usuario">
          <h4>Lucas Chacon</h4>
          <p>El rey del front</p>
          <p>{nContactos} contactos en la lista</p>
        </div>
      )}
    </div>
  );
};

export default Header;
