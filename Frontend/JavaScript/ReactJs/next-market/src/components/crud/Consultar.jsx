import React from 'react';

const AficionConsultar = ({ crypto }) => {
  
  return (
    <div>
      <h2>{crypto.nombre}</h2>
      <p><strong>Precio:</strong> {crypto.precio}</p>
    </div>
  );
};

export default AficionConsultar;
