import React, { useState } from "react";
import '../styles/formulario1.css'

const Formulario1 = () => {
  const [formData, setFormData] = useState({
    name: "",
    email: "",
    message: "",
    country: "Spain",
    subscribe: false,
  });

  const [errors, setErrors] = useState({
    name: "",
    email: "",
    message: "",
    subscribe: "",
  });

  const handleChange = (e) => {
    const { name, value, type, checked } = e.target;
    setFormData((prev) => ({
      ...prev,
      [name]: type === "checkbox" ? checked : value,
    }));
  };

  const validateForm = () => {
    const newErrors = {
      name: "",
      email: "",
      message: "",
      subscribe: "",
    };

    // Validación del nombre
    if (!formData.name) {
      newErrors.name = "El nombre es obligatorio.";
    }

    // Validación del correo electrónico
    if (!formData.email) {
      newErrors.email = "El correo electrónico es obligatorio.";
    } else if (!/\S+@\S+\.\S+/.test(formData.email)) {
      newErrors.email = "El correo electrónico no es válido.";
    }

    // Validación del mensaje
    if (!formData.message) {
      newErrors.message = "El mensaje es obligatorio.";
    }

    // Validación de la suscripción
    if (!formData.subscribe) {
      newErrors.subscribe = "Debes aceptar la suscripción.";
    }

    // Si hay errores, retornar el objeto de errores
    return newErrors;
  };

  const handleSubmit = (e) => {
    e.preventDefault();

    // Validar el formulario
    const validationErrors = validateForm();

    if (Object.values(validationErrors).some((error) => error !== "")) {
      // Si hay errores, se actualiza el estado de errores
      setErrors(validationErrors);
    } else {
      // Si no hay errores, procesar el envío del formulario
      alert(`Formulario enviado con los siguientes datos:\n${JSON.stringify(formData, null, 2)}`);
      // Limpiar los errores
      setErrors({
        name: "",
        email: "",
        message: "",
        subscribe: "",
      });
    }
  };

  return (
    <form onSubmit={handleSubmit}>
      <h2>Formulario de Contacto</h2>

      <div>
        <label htmlFor="name">Nombre:</label>
        <input
          type="text"
          id="name"
          name="name"
          value={formData.name}
          onChange={handleChange}
        />
        {errors.name && <div style={{ color: "red" }}>{errors.name}</div>}
      </div>

      <div>
        <label htmlFor="email">Correo electrónico:</label>
        <input
          type="email"
          id="email"
          name="email"
          value={formData.email}
          onChange={handleChange}
        />
        {errors.email && <div style={{ color: "red" }}>{errors.email}</div>}
      </div>

      <div>
        <label htmlFor="message">Mensaje:</label>
        <textarea
          id="message"
          name="message"
          value={formData.message}
          onChange={handleChange}
        />
        {errors.message && <div style={{ color: "red" }}>{errors.message}</div>}
      </div>

      <div>
        <label htmlFor="country">País:</label>
        <select
          id="country"
          name="country"
          value={formData.country}
          onChange={handleChange}
        >
          <option value="Spain">España</option>
          <option value="France">Francia</option>
          <option value="USA">Estados Unidos</option>
        </select>
      </div>

      <div>
        <label>
          <input
            type="checkbox"
            name="subscribe"
            checked={formData.subscribe}
            onChange={handleChange}
          />
          Acepto la suscripción
        </label>
        {errors.subscribe && <div style={{ color: "red" }}>{errors.subscribe}</div>}
      </div>

      <button type="submit">Enviar</button>
    </form>
  );
};

export default Formulario1;
