import React, { useState } from "react";
import { useNavigate } from "react-router-dom";
import Swal from "sweetalert2"; // Asegúrate de tenerlo instalado
import servicioUsuario from "../servicios/ServicioUsuario"; // Importar servicio

const Register = () => {
  const [usuario, setUsuario] = useState("");
  const [password, setPassword] = useState("");
  const [error, setError] = useState("");
  const navigate = useNavigate();

  const handleSubmit = async (e) => {
    e.preventDefault();

    if (!usuario || !password) {
      setError("Todos los campos son obligatorios");
      return;
    }

    try {
      const nuevoUsuario = { nombre: usuario, pass: password };

      const response = await servicioUsuario.create(nuevoUsuario);
      
      if (response.status === 201) {
        Swal.fire("Registro exitoso", "Usuario creado correctamente", "success");

        // Limpiar los campos
        setUsuario("");
        setPassword("");

        // Redirigir a login después de 2 segundos
        setTimeout(() => navigate("/login"), 2000);
      }
    } catch (error) {
      console.error("Error al registrar usuario:", error);
      Swal.fire("Error", "No se pudo registrar el usuario", "error");
      setError("Error en el registro. Inténtalo de nuevo.");
    }
  };

  return (
    <div>
      <h2>Registro</h2>
      <form onSubmit={handleSubmit}>
        <label>Usuario</label>
        <input type="text" value={usuario} onChange={(e) => setUsuario(e.target.value)} required />

        <label>Contraseña</label>
        <input type="password" value={password} onChange={(e) => setPassword(e.target.value)} required />

        {error && <p style={{ color: "red" }}>{error}</p>}

        <button type="submit">Registrarse</button>
      </form>
    </div>
  );
};

export default Register;
