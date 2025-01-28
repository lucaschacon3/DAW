import React, { useState } from 'react';
import servicioTareas from './services/servicioTareas';

function TareaCrear({ tareas, setTareas, onClose }) {
  // Almacenar los errores del formulario
  const [errores, setErrores] = useState({});

  // Almacenar los valores del formulario
  const [form, setForm] = useState({
    titulo: '',
    contenido: '',
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

    // Validación para "tarea"
    if (!form.titulo.trim()) {
      nuevosErrores.titulo = 'El titulo es obligatorio';
    }

    if (!form.contenido.trim()) {
      nuevosErrores.contenido = 'El contenido es obligatorio';
    }

    setErrores(nuevosErrores);

    // Retorna true si no hay errores, de lo contrario retorna false
    return Object.keys(nuevosErrores).length === 0;
  };

  // Función para manejar el envío del formulario
  const enviarFormulario = (e) => {
    e.preventDefault();

    // Validar antes de enviar
    if (validar()) {
      console.clear();
      console.log('Formulario Enviado', form);

      const nuevaTarea = {
        titulo: form.titulo,
        contenido: form.contenido,
      };

      // Enviar por Axios al JSON de la BD
      servicioTareas.create(nuevaTarea)
        .then(response => {
          alert("Contacto creado correctamente");
          
          // Limpiar el formulario después de agregar
          setForm({
            titulo: '',
            contenido: '',
          });

          // Le ponemos el id correcto de la BD
          nuevaTarea.id = response.data.id;

          // Actualizar el estado local de contactos
          setTareas([...tareas, nuevaTarea]);

          // Cerramos el modal
          onClose();

        })
        .catch(error => {
          alert("ERROR, Al crear contacto");
        });
    }
  };

  return (
    <form onSubmit={enviarFormulario}>
      {/* Campo de texto para tarea */}
      <label htmlFor="titulo">titulo del Contacto</label>
      <input
        id="titulo"
        type="text"
        name="titulo"
        value={form.titulo}
        onChange={gestionarCambio}
        placeholder="Escribe el titulo del contacto"
      />
      {errores.titulo && <p className="error">{errores.titulo}</p>}

      {/* Campo de texto para número de contacto */}
      <label htmlFor="contenido">Número de Teléfono</label>
      <input
        id="contenido"
        type="text"
        name="contenido"
        value={form.contenido}
        onChange={gestionarCambio}
        placeholder="Escribe el número de teléfono"
      />
      {errores.contenido && <p className="error">{errores.contenido}</p>}

      {/* Botón de envío */}
      <button type="submit">Enviar</button>
    </form>
  );
}

export default TareaCrear;
