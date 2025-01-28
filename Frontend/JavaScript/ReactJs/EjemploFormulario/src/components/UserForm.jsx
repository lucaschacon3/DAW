import React, { useState } from 'react';
import Input from './Input';
import Button from './Button';
import useFormulario from '../hooks/useFormulario';

const UserForm = ({ submit }) => {
  const [formulario, handleChange, reset] = useFormulario({
    name: '',
    email: '',
    lastname: '',
  });

  const [errors, setErrors] = useState({});

  const handleSubmit = (e) => {
    e.preventDefault();
    if (validate()) {
      submit(formulario);
      reset();
    }
  };

  const validate = () => {
    const newErrors = {};

    // Validación de nombre
    if (!formulario.name) {
      newErrors.name = 'El nombre es obligatorio.';
    }

    // Validación de apellido
    if (!formulario.lastname) {
      newErrors.lastname = 'El apellido es obligatorio.';
    }

    // Validación de email
    if (!formulario.email) {
      newErrors.email = 'El email es obligatorio.';
    } else if (!/\S+@\S+\.\S+/.test(formulario.email)) {
      newErrors.email = 'El email no es válido.';
    }

    setErrors(newErrors);
    return Object.keys(newErrors).length === 0; // Devuelve `true` si no hay errores
  };

  return (
    <form onSubmit={handleSubmit}>
      <Input
        label="Nombre"
        name="name"
        value={formulario.name}
        onChange={handleChange}
        placeholder="Nombre"
      />
      {errors.name && <span style={{ color: 'red' }}>{errors.name}</span>}

      <Input
        label="Apellido"
        name="lastname"
        value={formulario.lastname}
        onChange={handleChange}
        placeholder="Apellido"
      />
      {errors.lastname && <span style={{ color: 'red' }}>{errors.lastname}</span>}

      <Input
        label="Correo"
        name="email"
        value={formulario.email}
        onChange={handleChange}
        placeholder="Correo"
      />
      {errors.email && <span style={{ color: 'red' }}>{errors.email}</span>}

      <Button>Enviar</Button>
    </form>
  );
};

export default UserForm;
