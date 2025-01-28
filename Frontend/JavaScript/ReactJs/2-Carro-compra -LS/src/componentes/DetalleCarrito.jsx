import { Link } from "react-router-dom";
import "../estilos/detalleCarrito.css";
import { buscarProducto } from "../herramientas/buscarProducto";

const DetalleCarrito = ({ productosJson, setProductosJson, informacion }) => {

  // Función para añadir cantidad al producto
  const añadirCantidadProducto = (nombreProducto) => {
    setProductosJson(prevProductos => {
      return prevProductos.map(producto => {
        if (producto.nombre === nombreProducto) {
          // Incrementamos la cantidad del producto
          return { ...producto, cantidad: producto.cantidad + 1 };
        }
        return producto;
      });
    });
  };

  // Función para eliminar un producto del carrito
  const eliminarCantidadProducto = (nombreProducto) => {
    setProductosJson(prevProductos => {
      return prevProductos.filter(producto => producto.nombre !== nombreProducto);
    });
  };

  // Función para modificar la cantidad del producto
  const modificarCantidadProducto = (nombreProducto, nuevaCantidad) => {
    if (nuevaCantidad <= 0) return; // Evita cantidades negativas o cero

    setProductosJson(prevProductos => {
      return prevProductos.map(producto => {
        if (producto.nombre === nombreProducto) {
          return { ...producto, cantidad: nuevaCantidad };
        }
        return producto;
      });
    });
  };

  return (
    <div className="container-detalle-carrito">
      <ul>
        {productosJson.map((producto, index) => {
          let productoInformacion = buscarProducto(producto.nombre, informacion);

          return (
            <li key={index}>
              {productoInformacion.nombre} - {productoInformacion.precio} x {producto.cantidad}
              <Link to={`/detalle-producto/${productoInformacion.nombre}`}>
                <img src={productoInformacion.url} alt={productoInformacion.nombre} />
              </Link>
              {/* Botón para añadir cantidad al producto */}
              <button onClick={() => añadirCantidadProducto(productoInformacion.nombre)}>
                +
              </button>
              {/* Botón para eliminar el producto del carrito */}
              <button onClick={() => eliminarCantidadProducto(productoInformacion.nombre)}>
                -
              </button>
              {/* Botón para modificar la cantidad del producto */}
              <button onClick={() => modificarCantidadProducto(productoInformacion.nombre, producto.cantidad + 1)}>
                *
              </button>
            </li>
          );
        })}
      </ul>
    </div>
  );
};

export default DetalleCarrito;
