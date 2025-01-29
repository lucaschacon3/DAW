import { Link } from "react-router-dom";
import "../estilos/detalleCarrito.css";
import { buscarProducto } from "../herramientas/buscarProducto";

const DetalleCarrito = ({ productosJson, setProductosJson, informacion }) => {
  // Función para añadir cantidad al producto
  const añadirCantidadProducto = (nombreProducto) => {
    setProductosJson((prevProductos) => {
      return prevProductos.map((producto) => {
        if (producto.nombre === nombreProducto) {
          // Incrementamos la cantidad del producto
          return { ...producto, cantidad: producto.cantidad + 1 };
        }
        return producto;
      });
    });
  };

  const eliminarCantidadProducto = (nombreProducto) => {
    setProductosJson((prevProductos) => {
      return prevProductos.map((producto) => {
        if (producto.cantidad>0 && producto.cantidad<10) {
          if (producto.nombre === nombreProducto) {
            // Incrementamos la cantidad del producto
            return { ...producto, cantidad: producto.cantidad - 1 };
          }
        }else{
          setProductosJson(prevProductos => {
            return prevProductos.filter(producto => producto.nombre !== nombreProducto);
          });
        }
        return producto;
      });
    });
  };

  // Función para modificar la cantidad del producto
  const modificarCantidadProducto = (nombreProducto) => {
    let cantidad = parseInt(prompt("Introduce cantidad: "));
    while (cantidad > 10) {
      cantidad = parseInt(prompt("Error: Introduce cantidad menor a 10: "));
    }
    setProductosJson((prevProductos) => {
      return prevProductos.map((producto) => {
        if (producto.nombre === nombreProducto) {
          // Incrementamos la cantidad del producto
          return { ...producto, cantidad: producto.cantidad + cantidad };
        }
        return producto;
      });
    });
  };

  return (
    <div className="container-detalle-carrito">
      <ul>
        {productosJson.map((producto, index) => {
          let productoInformacion = buscarProducto(
            producto.nombre,
            informacion
          );

          return (
            <li key={index}>
              {productoInformacion.nombre} - {productoInformacion.precio} x{" "}
              {producto.cantidad}
              <Link to={`/detalle-producto/${productoInformacion.nombre}`}>
                <img
                  src={productoInformacion.url}
                  alt={productoInformacion.nombre}
                />
              </Link>
              {/* Botón para añadir cantidad al producto */}
              <button
                onClick={() =>
                  añadirCantidadProducto(productoInformacion.nombre)
                }
              >
                +
              </button>
              {/* Botón para eliminar el producto del carrito */}
              <button
                onClick={() =>
                  eliminarCantidadProducto(productoInformacion.nombre)
                }
              >
                -
              </button>
              {/* Botón para modificar la cantidad del producto */}
              <button
                onClick={() =>
                  modificarCantidadProducto(
                    productoInformacion.nombre,
                    producto.cantidad + 1
                  )
                }
              >
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
