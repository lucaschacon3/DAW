import { Link } from "react-router-dom";

const DetalleCarrito = ({ carrito, setCarrito, informacion }) => {
  const añadirCantidadProducto = (nombreProducto) => {
    setCarrito((prevProductos) =>
      prevProductos.map((producto) =>
        producto.nombre === nombreProducto
          ? { ...producto, cantidad: producto.cantidad + 1 }
          : producto
      )
    );
  };

  const eliminarCantidadProducto = (nombreProducto) => {
    setCarrito((prevProductos) =>
      prevProductos
        .map((producto) =>
          producto.nombre === nombreProducto
            ? { ...producto, cantidad: producto.cantidad - 1 }
            : producto
        )
        .filter((producto) => producto.cantidad > 0)
    );
  };

  const modificarCantidadProducto = (nombreProducto) => {
    let cantidad = parseInt(prompt("Introduce cantidad: "));
    while (isNaN(cantidad) || cantidad > 10 || cantidad < 1) {
      cantidad = parseInt(prompt("Error: Introduce cantidad entre 1 y 10: "));
    }
    setCarrito((prevProductos) =>
      prevProductos.map((producto) =>
        producto.nombre === nombreProducto
          ? { ...producto, cantidad }
          : producto
      )
    );
  };

  const buscarProducto = (nombre) =>
    informacion.find(
      (producto) => producto.nombre.toLowerCase() === nombre.toLowerCase()
    ) || null;

  // 🔹 Calcular el dinero total del carrito
  const totalDinero = carrito.reduce((total, producto) => {
    const productoInformacion = buscarProducto(producto.nombre);
    return productoInformacion
      ? total + productoInformacion.precio * producto.cantidad
      : total;
  }, 0);

  return (
    <div id="body" className="p-8 h-screen">
      <div className="max-w-3xl mx-auto p-6 bg-gray-100 rounded-lg shadow-md">
        <h2 className="text-2xl font-bold text-center mb-4">Carrito de Compras</h2>

        {carrito.length === 0 ? (
          <p className="text-center text-gray-500">El carrito está vacío.</p>
        ) : (
          <ul>
            {carrito.map((producto, index) => {
              const productoInformacion = buscarProducto(producto.nombre);
              if (!productoInformacion) return null;

              return (
                <li
                  key={index}
                  className="flex items-center justify-between bg-white p-4 rounded-lg shadow-sm mb-3"
                >
                  <div className="flex items-center gap-4">
                    <Link to={`/detalle-producto/${productoInformacion.nombre}`}>
                      <img
                        src={productoInformacion.url}
                        alt={productoInformacion.nombre}
                        className="w-16 h-16 rounded-md"
                      />
                    </Link>
                    <div>
                      <p className="text-lg font-semibold">{productoInformacion.nombre}</p>
                      <p className="text-gray-700">Precio: {productoInformacion.precio}€</p>
                      <p className="text-gray-700">Cantidad: {producto.cantidad}</p>
                      <p className="font-bold text-gray-900">
                        Total: {(productoInformacion.precio * producto.cantidad).toFixed(2)}€
                      </p>
                    </div>
                  </div>

                  <div className="flex gap-2">
                    <button
                      onClick={() => añadirCantidadProducto(producto.nombre)}
                      className="px-3 py-2 bg-green-500 text-white rounded-md hover:bg-green-600 transition"
                    >
                      +
                    </button>
                    <button
                      onClick={() => eliminarCantidadProducto(producto.nombre)}
                      className="px-3 py-2 bg-red-500 text-white rounded-md hover:bg-red-600 transition"
                    >
                      -
                    </button>
                    <button
                      onClick={() => modificarCantidadProducto(producto.nombre)}
                      className="px-3 py-2 bg-blue-500 text-white rounded-md hover:bg-blue-600 transition"
                    >
                      *
                    </button>
                  </div>
                </li>
              );
            })}
          </ul>
        )}

        <p className="mt-4 text-right font-bold text-lg">
          Total de productos: {carrito.reduce((acc, producto) => acc + producto.cantidad, 0)}
        </p>

        {/* 🔥 Muestra el total en dinero del carrito */}
        <p className="mt-2 text-right text-xl font-extrabold text-gray-900">
          Total a pagar: {totalDinero.toFixed(2)}€
        </p>

        <button className="mt-4 bg-cyan-500 text-white px-4 py-2 rounded-md hover:bg-cyan-600 transition">
          <Link to={"/"}>Ir atrás</Link>
        </button>
      </div>
    </div>
  );
};

export default DetalleCarrito;
