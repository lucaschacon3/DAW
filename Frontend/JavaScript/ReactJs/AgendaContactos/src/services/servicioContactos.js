
import http from "./http-axios.js";

class ServicioContactos {
  getAll() {
    return http.get("/contactos");
  }

  get(id) {
    return http.get(`/contactos/${id}`);
  }

  create(data) {
    return http.post("/contactos", data);
  }

  update(id, data) {
    console.log(id,data)
    return http.put(`/contactos/${id}`, data);
  }

  delete(id) {
    return http.delete(`/contactos/${id}`);
  }
}

export default new ServicioContactos();
