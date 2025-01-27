import React from 'react';

const AficionConsultar = ({ contacto }) => {
  
  return (
    <div>
      <h2>{contacto.nombre}</h2>
      <p><strong>Descripción:</strong> {contacto.numero}</p>
    </div>
  );
};

export default AficionConsultar;
