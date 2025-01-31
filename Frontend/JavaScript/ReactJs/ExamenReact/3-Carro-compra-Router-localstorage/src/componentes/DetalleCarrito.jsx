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
  function seleccionarCantidad(producto) {
    let cantidad = parseInt(prompt("Introduce cantidad: "));
    if (cantidad+producto.cantidad > 10 ) {
      alert(`Error: Introduce cantidad menor a 10, solo puedes añadir ${10-producto.cantidad}: `);
    }else if(cantidad<1 || isNaN(cantidad)){
      alert("Error: Introduce cantidad valida ");
    }else{
      setProductos((prevProductos) => {
        return prevProductos.map((productoM) => {
          if (productoM.nombre === producto.nombre) {
            // Incrementamos la cantidad del producto
            return { ...productoM, cantidad: productoM.cantidad + cantidad };
          }
          return productoM;
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
                    seleccionarCantidad(producto)
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
