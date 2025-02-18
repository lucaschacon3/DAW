
import http from "./http-axios.js";

class ServicioUsuario {
   getAllFrutas() {
     return http.get("/frutas");
   }

  login(usuario,pass) {
      return http.get(`/usuarios?nombre=${usuario}&pass=${pass}`);
      //http://localhost:3000/usuarios?nombre=agustin&pass=123
   }

   create(data) {
      return http.post("/usuarios", data);
    }
}

export default new ServicioUsuario();
