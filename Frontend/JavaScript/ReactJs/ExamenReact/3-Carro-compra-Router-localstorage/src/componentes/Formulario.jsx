import React, { useState } from "react";
import servicioProductos from "../servicios/servicioProductos";
import "../estilos/formulario.css";

const Formulario = ({ productos, setProductos }) => {
  const [form, setForm] = useState({ nombre: "", cantidad: "" });
  const [errores, setErrores] = useState({});
  const [total, setTotal] = useState(0);

  const validar = () => {
    const nuevosErrores = {};
    if (!form.nombre) {
      nuevosErrores.nombre = "Debe seleccionar un producto";
    }
    if (parseInt(form.cantidad, 10) > 5) {
      nuevosErrores.cantidad = "No se pueden añadir más de 5";
    }
    setErrores(nuevosErrores);
    return Object.keys(nuevosErrores).length === 0;
  };

  const gestionarCambio = (e) => {
    const { name, value } = e.target;
    setForm({ ...form, [name]: value });
  };

  const enviarFormulario = (e) => {
    e.preventDefault();
    if (validar()) {
      const productoSeleccionado = productos.find(p => p.nombre === form.nombre);
      if (productoSeleccionado) {
        const nuevoProducto = { ...productoSeleccionado, cantidad: parseInt(form.cantidad, 10) };
        setProductos([...productos, nuevoProducto]);
        setTotal(total + (nuevoProducto.precio * nuevoProducto.cantidad));
        setForm({ nombre: "", cantidad: "" });
      }
    }
  };

  return (
    <div className="form-container">
      <h1>Incluir Producto al Carrito</h1>
      <form id="productForm" onSubmit={enviarFormulario}>
        <label htmlFor="nombre">Productos:</label>
        <select id="nombre" name="nombre" value={form.nombre} onChange={gestionarCambio}>
          <option value="">Seleccione un producto</option>
          {productos.map((producto) => (
            <option key={producto.nombre} value={producto.nombre}>{producto.nombre}</option>
          ))}
        </select>
        {errores.nombre && <p className="error-message">{errores.nombre}</p>}

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
        />
        {errores.cantidad && <p className="error-message">{errores.cantidad}</p>}

        <button type="submit">Agregar al Carrito</button>
      </form>

      <h2>Total: ${total}</h2>
    </div>
  );
};

export default Formulario;
