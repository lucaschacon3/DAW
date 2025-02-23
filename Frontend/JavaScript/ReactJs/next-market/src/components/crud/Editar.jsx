import React, { useState } from 'react';
import servicioCryptos from '../../service/servicioCryptos';
import Swal from 'sweetalert2';

function CryptoEditar({ crypto, setCryptosInfo, onClose }) {
  const [errores, setErrores] = useState({});
  const [form, setForm] = useState({
    nombre: crypto.nombre,
    precio: crypto.precio || '', // Cambiar 'numero' a 'precio'
    url: crypto.url || '', // Agregar el campo url con un valor inicial
  });

  const gestionarCambio = (e) => {
    const { name, value } = e.target;
    setForm({
      ...form,
      [name]: value,
    });
  };

  const validar = () => {
    const nuevosErrores = {};

    if (!form.nombre.trim()) {
      nuevosErrores.nombre = 'El nombre es obligatorio';
    }

    if (!form.precio.trim()) {
      nuevosErrores.precio = 'El precio es obligatorio'; // Cambiar mensaje para 'precio'
    } else if (isNaN(form.precio) || parseFloat(form.precio) < 0) {
      nuevosErrores.precio = 'El precio debe ser un número positivo'; // Validar que sea un número
    }

    if (!form.url.trim()) {
      nuevosErrores.url = 'La URL es obligatoria'; // Validar que la URL no esté vacía
    } else if (!/^(ftp|http|https):\/\/[^ "]+$/.test(form.url)) {
      nuevosErrores.url = 'La URL no es válida'; // Validar formato de URL
    }

    setErrores(nuevosErrores);
    return Object.keys(nuevosErrores).length === 0;
  };

  const enviarFormulario = (e) => {
    e.preventDefault();
    if (validar()) {
      console.clear();
      console.log('Formulario Enviado', form);

      const editarCrypto = {
        nombre: form.nombre,
        precio: form.precio, // Incluir el precio al enviar el formulario
        url: form.url, // Incluir la URL al enviar el formulario
      };

      servicioCryptos.update(crypto.id, editarCrypto)
        .then(response => {
          Swal.fire("Crypto actualizada correctamente");
          setForm({ nombre: '', precio: '', url: '' }); // Limpiar también el campo URL
          servicioCryptos.getAll()
            .then((response) => {
              setCryptosInfo(response.data);
            });
          onClose();
        })
        .catch(error => {
          Swal.fire("ERROR, al actualizar la crypto");
        });
    }
  };

  return (
    <form onSubmit={enviarFormulario} className="bg-white p-6 rounded-lg shadow-md w-full max-w-lg">
      <label htmlFor="nombre" className="block text-sm font-medium text-gray-700">Nombre de la Crypto</label>
      <input
        id="nombre"
        type="text"
        name="nombre"
        value={form.nombre}
        onChange={gestionarCambio}
        placeholder="Escribe el nombre de la crypto"
        className="mt-1 p-2 w-full border rounded-md focus:ring focus:ring-blue-300"
      />
      {errores.nombre && <p className="text-red-500 text-sm mt-1">{errores.nombre}</p>}

      <label htmlFor="precio" className="block text-sm font-medium text-gray-700 mt-4">Precio</label>
      <input
        id="precio"
        type="text"
        name="precio"
        value={form.precio}
        onChange={gestionarCambio}
        placeholder="Escribe el precio de la crypto"
        className="mt-1 p-2 w-full border rounded-md focus:ring focus:ring-blue-300"
      />
      {errores.precio && <p className="text-red-500 text-sm mt-1">{errores.precio}</p>}

      <label htmlFor="url" className="block text-sm font-medium text-gray-700 mt-4">URL</label>
      <input
        id="url"
        type="text"
        name="url"
        value={form.url}
        onChange={gestionarCambio}
        placeholder="Escribe la URL de la crypto"
        className="mt-1 p-2 w-full border rounded-md focus:ring focus:ring-blue-300"
      />
      {errores.url && <p className="text-red-500 text-sm mt-1">{errores.url}</p>}

      <button type="submit" className="mt-4 bg-blue-500 text-white p-2 rounded-md w-full hover:bg-blue-700">Actualizar</button>
    </form>
  );
}

export default CryptoEditar;
