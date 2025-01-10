import React from 'react';

const AficionConsultar = ({ aficion }) => {
  
  return (
    <div>
      <h2>{aficion.nombre}</h2>
      <p><strong>Descripción:</strong> {aficion.descripcion}</p>
    </div>
  );
};

export default AficionConsultar;
