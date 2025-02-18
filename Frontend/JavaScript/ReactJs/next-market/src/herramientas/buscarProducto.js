
export function buscarProducto(nombre, informacion) {
  return informacion.find(producto => producto.name.toLowerCase() === nombre.toLowerCase()) || null;
}




