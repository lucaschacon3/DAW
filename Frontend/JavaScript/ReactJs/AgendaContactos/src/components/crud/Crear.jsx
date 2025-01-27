import React, { useState } from 'react';
import Swal from 'sweetalert2';
import servicioContactos from '../../services/servicioContactos';

function ContactoCrear({ contactos, setContactos, onClose }) {
  // Almacenar los errores del formulario
  const [errores, setErrores] = useState({});

  // Almacenar los valores del formulario
  const [form, setForm] = useState({
    nombre: '',
    numero: '',
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

    // Validación para "nombre"
    if (!form.nombre.trim()) {
      nuevosErrores.nombre = 'El nombre es obligatorio';
    }

    // Validación para "numero"
    if (!form.numero.trim()) {
      nuevosErrores.numero = 'El número es obligatorio';
    } else if (!/^\d+$/.test(form.numero)) {
      nuevosErrores.numero = 'El número debe ser solo dígitos';
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

      const nuevoContacto = {
        nombre: form.nombre,
        numero: form.numero,
      };

      // Enviar por Axios al JSON de la BD
      servicioContactos.create(nuevoContacto)
        .then(response => {
          Swal.fire("Contacto creado correctamente");
          
          // Limpiar el formulario después de agregar
          setForm({
            nombre: '',
            numero: '',
          });

          // Le ponemos el id correcto de la BD
          nuevoContacto.id = response.data.id;

          // Actualizar el estado local de contactos
          setContactos([...contactos, nuevoContacto]);

          // Cerramos el modal
          onClose();

        })
        .catch(error => {
          Swal.fire("ERROR, Al crear contacto");
        });
    }
  };

  return (
    <form onSubmit={enviarFormulario}>
      {/* Campo de texto para nombre */}
      <label htmlFor="nombre">Nombre del Contacto</label>
      <input
        id="nombre"
        type="text"
        name="nombre"
        value={form.nombre}
        onChange={gestionarCambio}
        placeholder="Escribe el nombre del contacto"
      />
      {errores.nombre && <p className="error">{errores.nombre}</p>}

      {/* Campo de texto para número de contacto */}
      <label htmlFor="numero">Número de Teléfono</label>
      <input
        id="numero"
        type="text"
        name="numero"
        value={form.numero}
        onChange={gestionarCambio}
        placeholder="Escribe el número de teléfono"
      />
      {errores.numero && <p className="error">{errores.numero}</p>}

      {/* Botón de envío */}
      <button type="submit">Enviar</button>
    </form>
  );
}

export default ContactoCrear;
