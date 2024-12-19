
import './css/App.css'

import React, { useState, useEffect } from "react";
import ComponenteSuperior from "./components/ComponenteSuperior";
import ComponenteCentral from "./components/ComponenteCentral";
import ComponenteInferior from "./components/ComponenteInferior";

const App = () => {
  const [servicios, setServicios] = useState([]);
  const [ultimoServicio, setUltimoServicio] = useState(null);

  // Cargar datos iniciales
  useEffect(() => {
    fetch("http://localhost:3000/servicios")
      .then((response) => response.json())
      .then((data) => setServicios(data))
      .catch((error) => console.error("Error al cargar servicios:", error));
  }, []);

  const agregarServicio = (nuevoServicio) => {
    fetch("http://localhost:3000/servicios", {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify(nuevoServicio),
    })
      .then((response) => response.json())
      .then((data) => {
        setServicios([...servicios, data]);
        setUltimoServicio(data);
      });
  };

  const actualizarServicio = (id, servicioActualizado) => {
    fetch(`http://localhost:3000/servicios/${id}`, {
      method: "PUT",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify(servicioActualizado),
    })
      .then((response) => response.json())
      .then((data) => {
        setServicios(
          servicios.map((servicio) =>
            servicio.id === id ? data : servicio
          )
        );
      });
  };

  const borrarServicio = (id) => {
    fetch(`http://localhost:3000/servicios/${id}`, { method: "DELETE" })
      .then(() => {
        setServicios(servicios.filter((servicio) => servicio.id !== id));
      });
  };

  return (
    <div>
      <ComponenteSuperior servicios={servicios} />
      <ComponenteCentral
        servicios={servicios}
        agregarServicio={agregarServicio}
        actualizarServicio={actualizarServicio}
        borrarServicio={borrarServicio}
      />
      <ComponenteInferior ultimoServicio={ultimoServicio} />
    </div>
  );
};

export default App;

