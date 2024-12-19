import React from "react";

const ComponenteSuperior = ({ servicios }) => {
  const totalServicios = servicios.length;
  
  let importeTotal = 0; // Inicializamos el total en 0
  servicios.forEach((servicio) => {
    importeTotal = importeTotal+servicio.importe; // Sumar el importe de cada servicio al total
  });

  return (
    <div style={{ padding: "20px", background: "#f9f9f9", textAlign: "center" }}>
      <h2>Resumen de Servicios</h2>
      <p>Total de servicios: {totalServicios}</p>
      <p>Importe total acumulado: ${importeTotal}</p>
    </div>
  );
};

export default ComponenteSuperior;
