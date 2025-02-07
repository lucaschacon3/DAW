import React, { useState } from "react";
import { useNavigate } from "react-router-dom";
import { useAuth } from "../components/AuthProvider";
import ServicioUsuario from "../service/ServicioUsuario";
import bcrypt from "bcryptjs"; // Importar bcryptjs;

const Login = () => {
  const [usuario, setUsuario] = useState("");
  const [password, setPassword] = useState("");
  const [error, setError] = useState("");
  const { login } = useAuth();
  const navigate = useNavigate();

  const handleSubmit = async (e) => {
    e.preventDefault();

    // Encriptar la contraseña antes de enviarla
    //const hashedPassword = await bcrypt.hash(password, 10);

    try {
      const response = await ServicioUsuario.login(usuario);

      if (response.data.length !== 0) {
        const user = response.data[0];

        // Comparar la contraseña ingresada con la almacenada (encriptada en el frontend)
        const isMatch = await bcrypt.compare(password, user.password);

        if (isMatch) {
          login(user); // Guarda el usuario completo
          navigate("/");
        } else {
          setError("Usuario o contraseña incorrectos");
        }
      } else {
        setError("Usuario o contraseña incorrectos");
      }
    } catch (error) {
      setError("Error al conectar con el servidor");
    }
  };

  return (
    <div>
      <h2>Login</h2>
      <form onSubmit={handleSubmit}>
        <div>
          <label>Usuario</label>
          <input
            type="text"
            value={usuario}
            onChange={(e) => setUsuario(e.target.value)}
            required
          />
        </div>
        <div>
          <label>Password:</label>
          <input
            type="password"
            value={password}
            onChange={(e) => setPassword(e.target.value)}
            required
          />
        </div>
        {error && <p style={{ color: "red" }}>{error}</p>}
        <button type="submit">Login</button>
      </form>
    </div>
  );
};

export default Login;
