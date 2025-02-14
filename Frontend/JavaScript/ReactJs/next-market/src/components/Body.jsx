import React, { useState } from "react";

const Body = ({ cryptos, balances, setBalances, carrito, setCarrito }) => {
  
  const anadirProducto = (name, precio) => {
    setBalances((prevBalance) => prevBalance + precio); // Sumar al balance

    if (buscarProducto(name, carrito) === null) {
      setCarrito([...carrito, { name: name, cantidad: 1 }]);
    } else {
      setCarrito(incrementarCantidad(carrito, name));
    }
  };

  const borrarProducto = (name, precio) => {
    const productoEncontrado = buscarProducto(name, carrito);

    if (productoEncontrado !== null && productoEncontrado.cantidad > 0) {
      setBalances((prevBalance) => prevBalance - precio); // Restar del balance

      if (productoEncontrado.cantidad > 1) {
        setCarrito(decrementarCantidad(carrito, name));
      } else {
        setCarrito(carrito.filter((producto) => producto.name !== name));
      }
    }
  };

  function decrementarCantidad(informacion, nombre) {
    return informacion.map((producto) => {
      if (producto.name === nombre && producto.cantidad > 0) {
        return { ...producto, cantidad: producto.cantidad - 1 };
      }
      return producto;
    });
  }

  function incrementarCantidad(informacion, nombre) {
    return informacion.map((producto) => {
      if (producto.name === nombre) {
        return { ...producto, cantidad: producto.cantidad + 1 };
      }
      return producto;
    });
  }

  function buscarProducto(nombre, informacion) {
    return (
      informacion.find(
        (producto) => producto.name.toLowerCase() === nombre.toLowerCase()
      ) || null
    );
  }

  
  return (
    <div className="p-8">
      <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-4">
        {cryptos.map((crypto) => (
          <div
            key={crypto.id}
            className="bg-gray-900 text-white p-6 rounded-lg shadow-md text-center"
          >
            <h3 className="text-xl font-semibold">
              {crypto.name}
            </h3>
            <p className="text-gray-400">${crypto.price.toLocaleString()}</p>
            <img src={crypto.url} alt={crypto.name} width="150px" className="mx-auto" />

            <div className="flex justify-center mt-4 space-x-2">
              <button
                className="bg-green-500 text-white px-4 py-2 rounded-lg hover:bg-green-600 transition"
                onClick={() => anadirProducto(crypto.name, crypto.price)}
              >
                Comprar
              </button>
              <button
                className="bg-red-500 text-white px-4 py-2 rounded-lg hover:bg-red-600 transition"
                onClick={() => borrarProducto(crypto.name, crypto.price)}
              >
                Vender
              </button>
            </div>
          </div>
        ))}
      </div>
    </div>
  );
};

export default Body;
