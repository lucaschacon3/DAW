import React, { useState } from "react";
import { toast, ToastContainer } from "react-toastify";
import "react-toastify/dist/ReactToastify.css";

const Body = ({ cryptosInfo, setBalance, carrito, setCarrito, notificaciones }) => {
  const notify = () => toast("Producto añadido en WebStorage");

  const anadirProducto = (nombre, precio) => {
    setBalance((prevBalance) => prevBalance + precio); // Sumar al balance

    if (buscarProducto(nombre, carrito) === null) {
      setCarrito([...carrito, { nombre: nombre, cantidad: 1 }]);
    } else {
      setCarrito(incrementarCantidad(carrito, nombre));
    }

    if(notificaciones){
      notify(); // Llamar a la función notify para mostrar el mensaje
    }

  };

  const borrarProducto = (nombre, precio) => {
    const productoEncontrado = buscarProducto(nombre, carrito);

    if (productoEncontrado !== null && productoEncontrado.cantidad > 0) {
      setBalance((prevBalance) => prevBalance - precio); // Restar del balance

      if (productoEncontrado.cantidad > 1) {
        setCarrito(decrementarCantidad(carrito, nombre));
      } else {
        setCarrito(carrito.filter((producto) => producto.nombre !== nombre));
      }
    }
  };

  function decrementarCantidad(carrito, nombre) {
    return carrito.map((producto) => {
      if (producto.nombre === nombre && producto.cantidad > 0) {
        return { ...producto, cantidad: producto.cantidad - 1 };
      }
      return producto;
    });
  }

  function incrementarCantidad(carrito, nombre) {
    return carrito.map((producto) => {
      if (producto.nombre === nombre) {
        return { ...producto, cantidad: producto.cantidad + 1 };
      }
      return producto;
    });
  }

  function buscarProducto(nombre, carrito) {
    return (
      carrito.find(
        (producto) => producto.nombre.toLowerCase() === nombre.toLowerCase()
      ) || null
    );
  }

  return (
    <div className="min-h-screen p-8 " id="body">
      <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-4">
        {cryptosInfo.map((crypto) => (
          <div
            key={crypto.id}
            className="bg-gray-900 text-white p-6 rounded-lg shadow-md text-center"
          >
            <h3 className="text-xl font-semibold">
              {crypto.nombre}
            </h3>
            <p className="text-gray-400">${crypto.precio.toLocaleString()}</p>
            <img src={crypto.url} alt={crypto.nombre} width="150px" className="mx-auto" />

            <div className="flex justify-center mt-4 space-x-2">
              <button
                className="bg-green-500 text-white px-4 py-2 rounded-lg hover:bg-green-600 transition"
                onClick={() => anadirProducto(crypto.nombre, crypto.precio)}
              >
                Comprar
              </button>
              <button
                className="bg-red-500 text-white px-4 py-2 rounded-lg hover:bg-red-600 transition"
                onClick={() => borrarProducto(crypto.nombre, crypto.precio)}
              >
                Vender
              </button>
            </div>
          </div>
        ))}
      </div>
      <ToastContainer /> {/* Asegúrate de incluir el ToastContainer aquí */}
    </div>
  );
};

export default Body;
