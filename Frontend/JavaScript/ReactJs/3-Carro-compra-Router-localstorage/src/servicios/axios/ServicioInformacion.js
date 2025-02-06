
import http from "./http-axios.js";

class ServicioInformacion {
   getAll() {
     return http.get("/informacion");
   }  

   getPorNombre(nombre) {
    return http.get(`/informacion?nombre=${nombre}`);
  } 

  getPorPrecio(precioMenor,precioSuperior){
    let url= "/informacion?"
    if (precioMenor){
      url+=`precio_gt=${precioMenor}`
    }
    if (precioSuperior){
      url+=`&precio_lt=${precioSuperior}`
    }
    return http.get(url);
  }

  get(id) {
    return http.get(`/informacion/${id}`);
  } 
}

export default new ServicioInformacion();
