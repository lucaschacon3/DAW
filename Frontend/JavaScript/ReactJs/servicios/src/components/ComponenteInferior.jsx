import React from "react";

const ComponenteInferior = ({ ultimoServicio }) => {
  if (!ultimoServicio) return <div style={{ textAlign: "center", padding: "20px" }}>No hay servicios recientes.</div>;

  return (
    <div style={{ padding: "20px", background: "#f1f1f1", textAlign: "center" }}>
      <h4>Último Servicio Añadido</h4>
      <p><strong>Nombre:</strong> {ultimoServicio.nombre}</p>
      <p><strong>Descripción:</strong> {ultimoServicio.descripcion}</p>
      <p>
        <strong>URL:</strong> <a href={ultimoServicio.url} target="_blank" rel="noopener noreferrer">{ultimoServicio.url}</a>
      </p>
      <p><strong>Importe:</strong> ${ultimoServicio.importe}</p>
    </div>
  );
};

export default ComponenteInferior;
