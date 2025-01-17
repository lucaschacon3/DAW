import { Link } from "react-router-dom";
import "../styles/detalles.css";

// Componente MenuSuperior
const Detalles = ({ productos, informacion }) => {

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
            return <Link to={`/detalle-producto/:nombre ${producto}`}><li key={indice}>{productoInformacion.nombre} - {`${productoInformacion.precio} $`} <img src={productoInformacion.url} alt="" width="70px" /></li></Link>
            
          })
        }
      </ul>
    </div>
  );
};

export default Detalles;
