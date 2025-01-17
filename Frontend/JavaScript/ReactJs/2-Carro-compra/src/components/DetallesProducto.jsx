import "../styles/detalles.css";

// Componente MenuSuperior
const DetallesProducto = ({ productos, informacion }) => {

  function buscarProductos(nombre) {
    return informacion.find(producto => producto.nombre===nombre)
  }
  return (
    <div>
      <h1>Detalles carrito</h1>
      <ul>
        {
          productos.map((producto,indice) =>{
            let productoInformacion=buscarProductos(producto)
            return <li key={indice}>{productoInformacion.nombre} - {`${productoInformacion.precio} $`} <img src={productoInformacion.url} alt="" width="70px" /></li>
          })
        }
      </ul>
    </div>
  );
};

export default DetallesProducto;
