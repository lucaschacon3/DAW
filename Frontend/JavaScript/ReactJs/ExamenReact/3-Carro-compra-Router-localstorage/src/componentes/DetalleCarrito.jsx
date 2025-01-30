import { Link } from 'react-router-dom';
import '../estilos/DetalleCarrito.css';
import { incrementarCantidad } from '../herramientas/buscarProducto';

import Formulario from './Formulario'

const DetalleCarrito = ({ productos, setProductos , total, setTotal}) => {

   
  function incrementar(producto){
    // Actualizamos lista de productos
    setProductos(incrementarCantidad(productos, producto.nombre))
    //Actualiamos el total
    setTotal(total + producto.precio);    
  
  }
  function seleccionarCantidad(nombreProducto) {
    let cantidad = parseInt(prompt("Introduce cantidad: "));
    if (cantidad > 10) {
      alert("Error: Introduce cantidad menor a 10: ");
    }else if(cantidad<1){
      alert("Error: Introduce cantidad mayor a 0: ");
    }else{
      setProductos((prevProductos) => {
        return prevProductos.map((producto) => {
          if (producto.nombre === nombreProducto) {
            // Incrementamos la cantidad del producto
            return { ...producto, cantidad: producto.cantidad + cantidad };
          }
          return producto;
        });
      });
    }

  }
  return (
    <div className="container-detalle">
      <ul>
        <h2>Productos Seleccionados</h2>
        {productos.map((producto, index) => {
          return (
            <li key={index} className="producto-item">
              <div className="producto-detalle">
                <span>
                  {producto.cantidad} x {producto.nombre} : {producto.precio}Є
                </span>
                <Link to={`/producto/${producto.nombre}`}>
                  <img src={producto.url} alt={producto.nombre} />
                </Link>
              </div>

              {/* Botones para incrementar/reducir cantidad */}
              <div className="producto-acciones">                
                <button
                  className="btn-incrementar"
                  onClick={() =>
                    incrementar(producto)
                  }
                >
                  +
                </button>
                <button
                  className="btn-incrementar"
                  onClick={() =>
                    seleccionarCantidad(producto.nombre)
                  }
                >
                  *
                </button>
              </div>
            </li>
          );
        })}
        <li className="total">Número de Elementos: {productos.length}</li>
      </ul>

      <Formulario productos={productos} setProductos={setProductos}></Formulario>
    </div>


  );
};

export default DetalleCarrito;
