
import http from "./http-axios.js";

class ServicioCryptos {
  getAll() {
    return http.get("/cryptos");
  }

  get(id) {
    return http.get(`/cryptos/${id}`);
  }

  create(data) {
    return http.post("/cryptos", data);
  }

  update(id, data) {
    console.log(id,data)
    return http.put(`/cryptos/${id}`, data);
  }

  delete(id) {
    return http.delete(`/cryptos/${id}`);
  }
}

export default new ServicioCryptos();
