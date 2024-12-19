import React, { useState } from "react";

const ComponenteCentral = ({ servicios, setServicios, setUltimoServicio }) => {
  const [modalVisible, setModalVisible] = useState(false);
  const [nuevoServicio, setNuevoServicio] = useState({
    nombre: "",
    descripcion: "",
    url: "",
    importe: ""
  });

  // Manejar cambios en el formulario
  const manejarCambio = (e) => {
    const { name, value } = e.target;
    setNuevoServicio({ ...nuevoServicio, [name]: value });
  };

  // Añadir un nuevo servicio
  const agregarServicio = () => {
    if (nuevoServicio.nombre === "" || nuevoServicio.importe === "") {
      alert("El nombre y el importe son obligatorios.");
      return;
    }

    const nuevo = {
      id: Date.now(), // Generar un id único
      ...nuevoServicio,
      importe: parseFloat(nuevoServicio.importe) // Asegurar que el importe sea un número
    };

    setServicios([...servicios, nuevo]);
    setUltimoServicio(nuevo); // Actualiza el último servicio agregado
    setModalVisible(false); // Cierra el modal
    setNuevoServicio({ nombre: "", descripcion: "", url: "", importe: "" }); // Limpia el formulario
  };

  // Borrar un servicio
  const borrarServicio = (id) => {
    const nuevosServicios = servicios.filter((servicio) => servicio.id !== id);
    setServicios(nuevosServicios);
  };

  // Actualizar un servicio (para simplificar, lo simularemos con un prompt)
  const actualizarServicio = (id) => {
    const nuevosServicios = servicios.map((servicio) => {
      if (servicio.id === id) {
        const nuevoNombre = prompt("Ingrese el nuevo nombre:", servicio.nombre);
        const nuevoImporte = prompt("Ingrese el nuevo importe:", servicio.importe);
        if (nuevoNombre && nuevoImporte) {
          return {
            ...servicio,
            nombre: nuevoNombre,
            importe: parseFloat(nuevoImporte)
          };
        }
      }
      return servicio;
    });
    setServicios(nuevosServicios);
  };

  return (
    <div style={{ padding: "20px" }}>
      <h2>Lista de Servicios</h2>
      <ul>
        {servicios.map((servicio) => (
          <li key={servicio.id} style={{ marginBottom: "10px" }}>
            <strong>{servicio.nombre}</strong> - {servicio.descripcion} - ${servicio.importe}
            <button onClick={() => borrarServicio(servicio.id)} style={{ marginLeft: "10px" }}>
              Borrar
            </button>
            <button onClick={() => actualizarServicio(servicio.id)} style={{ marginLeft: "10px" }}>
              Actualizar
            </button>
          </li>
        ))}
      </ul>
      <button onClick={() => setModalVisible(true)} style={{ marginTop: "20px" }}>
        Añadir Servicio
      </button>

      {modalVisible && (
        <div style={{ padding: "20px", background: "#f0f0f0", marginTop: "20px" }}>
          <h3>Nuevo Servicio</h3>
          <label>
            Nombre: <input type="text" name="nombre" value={nuevoServicio.nombre} onChange={manejarCambio} />
          </label>
          <br />
          <label>
            Descripción: <input type="text" name="descripcion" value={nuevoServicio.descripcion} onChange={manejarCambio} />
          </label>
          <br />
          <label>
            URL: <input type="text" name="url" value={nuevoServicio.url} onChange={manejarCambio} />
          </label>
          <br />
          <label>
            Importe: <input type="number" name="importe" value={nuevoServicio.importe} onChange={manejarCambio} />
          </label>
          <br />
          <button onClick={agregarServicio} style={{ marginTop: "10px" }}>
            Guardar
          </button>
          <button onClick={() => setModalVisible(false)} style={{ marginTop: "10px", marginLeft: "10px" }}>
            Cancelar
          </button>
        </div>
      )}
    </div>
  );
};

export default ComponenteCentral;
