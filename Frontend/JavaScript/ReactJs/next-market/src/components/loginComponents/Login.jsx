import React, { useState } from "react";
import { useNavigate } from "react-router-dom";
import { Link } from "react-router-dom";
import { useAuth } from "./AuthProvider";
import ServicioUsuario from "../../service/ServicioUsuario";
import bcrypt from "bcryptjs";

const Login = () => {
  const [usuario, setUsuario] = useState("");
  const [password, setPassword] = useState("");
  const [error, setError] = useState("");
  const { login } = useAuth();
  const navigate = useNavigate();

  const handleSubmit = async (e) => {
    e.preventDefault();
    try {
      const response = await ServicioUsuario.login(usuario);
      if (response.data.length !== 0) {
        const user = response.data[0];
        const isMatch = await bcrypt.compare(password, user.password);
        if (isMatch) {
          login(user);
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
    <div
      className="flex items-center justify-center min-h-screen bg-gray-100"
      id="body"
    >
      <div className="bg-[#1E1E1E] p-8 rounded-lg shadow-md w-96">
        <h2 className="text-2xl font-semibold text-center mb-4 text-white">
          Login
        </h2>
        <form onSubmit={handleSubmit} className="space-y-10">
          <div>
            <label className="block text-white">Usuario</label>
            <input
              type="text"
              className="w-full px-4 py-2 mt-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500 text-white"
              value={usuario}
              onChange={(e) => setUsuario(e.target.value)}
              required
            />
          </div>
          <div>
            <label className="block text-white">Password</label>
            <input
              type="password"
              className="w-full px-4 py-2 mt-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500 text-white"
              value={password}
              onChange={(e) => setPassword(e.target.value)}
              required
            />
          </div>
          {error && <p className="text-red-500 text-sm">{error}</p>}
          <button
            type="submit"
            className="w-full bg-purple-600 text-white py-2 rounded-lg hover:bg-purple-700 transition duration-300"
          >
            Login
          </button>
          <p className="text-white underline">
            <Link to={"/register"}>No tienes cuenta todavía?</Link>
          </p>
        </form>
      </div>
    </div>
  );
};

export default Login;
