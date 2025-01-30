import React from "react";
import servicioProductos from "../servicios/servicioProductos";
import { useState } from "react";
import '../estilos/formulario.css'

const Formulario = ({ productos, setProductos }) => {
  const [form, setForm] = useState({
    nombre: "",
    cantidad: "",
  });
  const [errores, setErrores] = useState({});

  /* 
  const validar = () => {
    const nuevosErrores = {};

    // Validación para "nombre"
    if (!parseInt(form.cantidad)  < 5) {
      nuevosErrores.nombre = "no se pueden añadir mas de 5";
    }

    setErrores(nuevosErrores);

    // Retorna true si no hay errores, de lo contrario retorna false
    return Object.keys(nuevosErrores).length === 0;
  };
*/

  const gestionarCambio = (e) => {
    const { name, value } = e.target;

    setForm({
      ...form,
      [name]: value,
    });
  };
  const enviarFormulario = (e) => {
    e.preventDefault();
    //if (validar()) {
      const nuevoProducto = {
        nombre: form.nombre,
        cantidad: form.cantidad,
      }; 

      
    //}
  };
  return (
    <div className="form-container">
      <h1>Incluir Producto al Carrito</h1>
      <form
        id="productForm"
        action="#"
        method="POST"
        onSubmit={enviarFormulario}
      >
        <label htmlFor="nombre">Productos:</label>
        <select id="nombre" name="nombre">
          <option value={form.nombre} onChange={gestionarCambio}>
            Aceitunas
          </option>
          <option value={form.nombre} onChange={gestionarCambio}>
            Calabacín
          </option>
          <option value={form.nombre} onChange={gestionarCambio}>
            Ajos
          </option>
          <option value={form.nombre} onChange={gestionarCambio}>
            Calabaza
          </option>
        </select>

        <label htmlFor="cantidad">Cantidad:</label>
        <input
          type="number"
          id="cantidad"
          name="cantidad"
          min="1"
          max="10"
          required
          value={form.cantidad}
          onChange={gestionarCambio}
        ></input>
        <div id="error-message" className="error-message">
          {" "}
          {errores.cantidad && <p className="error">{errores.cantidad}</p>}
        </div>

        <button type="submit">Agregar al Carrito</button>
      </form>
    </div>
  );
};

export default Formulario;
