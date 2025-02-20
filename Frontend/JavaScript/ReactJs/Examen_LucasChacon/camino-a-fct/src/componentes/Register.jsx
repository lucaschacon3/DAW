import React, { useState } from "react";
import { useNavigate } from "react-router-dom";
import Swal from "sweetalert2"; // Asegúrate de tenerlo instalado
import bcrypt from "bcryptjs"; // Importar bcryptjs
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
      // Encriptar la contraseña con bcryptjs
      const hashedPassword = await bcrypt.hash(password, 10);

      const nuevoUsuario = { nombre: usuario, pass: hashedPassword };

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
    <div className="flex justify-center items-center min-h-screen bg-gray-100" id="body">
      <div className="bg-[#1E1E1E] p-8 rounded-lg shadow-lg w-full sm:w-96">
        <h2 className="text-white text-2xl font-bold mb-6 text-center">Registro</h2>
        <form onSubmit={handleSubmit}>
          <div className="mb-4">
            <label className="block text-white font-semibold mb-2">Usuario</label>
            <input 
              type="text" 
              value={usuario} 
              onChange={(e) => setUsuario(e.target.value)} 
              required 
              className="w-full p-3 border border-gray-300 rounded-lg focus:outline-none focus:border-blue-500"
            />
          </div>

          <div className="mb-4">
            <label className="block text-white font-semibold mb-2">Contraseña</label>
            <input 
              type="password" 
              value={password} 
              onChange={(e) => setPassword(e.target.value)} 
              required 
              className="w-full p-3 border border-gray-300 rounded-lg focus:outline-none focus:border-blue-500"
            />
          </div>

          {error && <p className="text-red-500 text-sm mt-2">{error}</p>}

          <button 
            type="submit" 
            className="w-full bg-purple-500 text-white p-3 rounded-lg mt-4 hover:bg-purple-600 focus:outline-none"
          >
            Registrarse
          </button>
        </form>
      </div>
    </div>
  );
};

export default Register;
