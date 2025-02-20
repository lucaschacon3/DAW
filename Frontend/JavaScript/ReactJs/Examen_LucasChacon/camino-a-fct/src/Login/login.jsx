import React, { useState } from "react";
import { useNavigate } from "react-router-dom";
import { Link } from "react-router-dom";
import { useAuth } from "./AuthProvider";
import ServicioUsuario from "../servicios/ServicioUsuario";
import bcrypt from "bcryptjs";

const Login = () => {
  const [usuario, setUsuario] = useState("");
  const [password, setPassword] = useState("");
  const [error, setError] = useState("");
  const { login } = useAuth();
  const navigate = useNavigate();

  const handleSubmit = async (e) => {
    e.preventDefault();
    //const response = await ServicioUsuario.login(usuario,password);
    ServicioUsuario.login(usuario, password)
      .then((response) => {
        if (response.data.length !== 0) {
          if(response.data[0].administrador===1){
            navigate("/admin");
          }
          login(response.data[0].nombre);
          navigate("/");
        } else {
          setError("Usuario no es correcto");
        }
      })
      .catch((error) => {
        alert(error);
        navigate("/login");
      });
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

        <label htmlFor="notificaciones">
          {" "}
          Desea recibir notificaciones?
          <input type="checkbox" name="notificaciones" id="notificaciones" />
        </label>
        <br />
        <label htmlFor="sesion">
          {" "}
          Desea recordar sesion?
          <input type="checkbox" name="sesion" id="sesion" />
        </label>
        <button type="submit">Login</button>
        
      </form>
      <p className="text-white underline">
            <Link to={"/register"}>No tienes cuenta todavía?</Link>
          </p>
    </div>
  );
};

export default Login;
