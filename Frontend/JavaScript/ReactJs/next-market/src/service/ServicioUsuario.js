
import http from "./http-axios.js";

class ServicioUsuario {

  login(usuario) {
      return http.get(`/usuarios?nombre=${usuario}`);
      //http://localhost:3000/usuarios?nombre=agustin&pass=123
   }
   create(data) {
      return http.post("/usuarios", data);
    }

}

export default new ServicioUsuario();
