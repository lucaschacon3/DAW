import React, { useState } from 'react';
import '../estilos/Administrador.css';
import ServicioInformacion from '../servicios/axios/ServicioInformacion';

function Administrador() {
  // Almacenar los errores del Formulario
  const [errores, setErrores] = useState({});
  const [informacion, setInformacion] = useState([])

  // Amacenar los valores del formulario(En todo momento!!!) 
  const [form, setForm] = useState({
    nombre: '',
    precioMenor: "",
    precioMayor: "",

  });

  //////////////////////////////////////
  // Función para gestionar los cambios en los campos del formulario
  //////////////////////////////////////
  const gestionarCambio = (e) => {

    const { name, value } = e.target;

    setForm({
      ...form,
      [name]: value,
    });


  };
  //////////////////////////////////////
  // Función de validación
  //////////////////////////////////////
  const validar = () => {
    const nuevosErrores = {};

    // Validar que el nombre no esté vacío si se ingresa
    if (form.nombre.trim() && !/^[a-zA-Z\s]+$/.test(form.nombre)) {
      nuevosErrores.nombre = 'El nombre solo puede contener letras y espacios.';
    }

    // Validar que los precios sean números válidos
   
    // Validar que el precio mínimo no sea negativo
   
    // Validar que el precio mínimo no sea mayor que el precio máximo
   

    setErrores(nuevosErrores);
    return Object.keys(nuevosErrores).length === 0;
  };

  // Función para manejar el envío del formulario
  const enviarFormulario = (e) => {
    e.preventDefault(); // Evita que el formulario se envíe automáticamente
  
    // Validar el formulario antes de enviar
    if (validar()) {
      // Si el campo "nombre" está lleno, buscar por nombre
      if (form.nombre.trim() !== "") {
        ServicioInformacion.getPorNombre(form.nombre)
          .then((response) => {
            setInformacion(response.data); // Actualiza el estado con los resultados
          })
          .catch((error) => {
            alert("No se ha podido descargar la información...");
            console.error(error); // Muestra el error en la consola
          });
      }
      // Si los campos de precio están llenos, buscar por precio
      else if (form.precioMenor.trim() !== "" || form.precioMayor.trim() !== "") {
        ServicioInformacion.getPorPrecio(form.precioMenor, form.precioMayor)
          .then((response) => {
            setInformacion(response.data); // Actualiza el estado con los resultados
          })
          .catch((error) => {
            alert("No se ha podido descargar la información...");
            console.error(error); // Muestra el error en la consola
          });
      }
      // Si no se llenó ningún campo, mostrar un mensaje
      else {
        alert("Por favor, complete al menos un campo para buscar.");
      }
    } else {
      alert("Por favor, corrija los errores en el formulario antes de enviar.");
    }
  };


  return (
    <>
      <div className="filters">
        <form onSubmit={enviarFormulario}>
          {/* Campo de texto para nombre */}
          <label htmlFor="nombre">Nombre</label>
          <input
            id="nombre"
            type="text"
            name="nombre"
            value={form.nombre}
            onChange={gestionarCambio}
            placeholder="Escribe tu nombre"
          />
          {errores.nombre && <p className="error">{errores.nombre}</p>}

          {/* Campo de texto para apellidos */}
          <label htmlFor="apellidos">Precio Mínomo</label>
          <input
            id="precioMenor"
            type="text"
            name="precioMenor"
            value={form.precioMenor}
            onChange={gestionarCambio}
            placeholder="importe Mínimo"
          />
        

          <label htmlFor="apellidos">Precio Máximo</label>
          <input
            id="precioMayor"
            type="text"
            name="precioMayor"
            value={form.precioMayor}
            onChange={gestionarCambio}
            placeholder="importe Máximo"
          />
        

          <button type="submit">Bucar</button>
          <button type="button">Limpiar</button>
        </form>
      </div>
      <table>
        <thead>
          <tr>
            <th>ID</th>
            <th>Nombre</th>
            <th>Precio (€)</th>
            <th>URL</th>
            <th>Acciones</th>
          </tr>
        </thead>
        <tbody id="productTable">

          {informacion.map((item, index) => (
            <tr key={index}>

              <td>{item.id}</td>
              <td>{item.nombre}</td>
              <td>{item.precio}</td>
              <td><a href="#">Ver Producto</a></td>
              <td className="actions">
                <button className="edit">Editar</button>
                <button className="delete">Eliminar</button>
                <button className="view">Consultar</button>
              </td>
            </tr>


          ))}


        </tbody>
      </table>
    </>

  );
}

export default Administrador;
