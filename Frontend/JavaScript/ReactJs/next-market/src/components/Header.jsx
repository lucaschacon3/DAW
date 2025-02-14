import React, { useState } from "react";
import { ShoppingCart } from "lucide-react";
import { useNavigate } from "react-router-dom";

const Header = ({ balances, carrito }) => {
  const [cartOpen, setCartOpen] = useState(false);

  // Calcular la cantidad total de productos en el carrito
  const totalCantidad = carrito.reduce(
    (total, producto) => total + producto.cantidad,
    0
  );
  const navigate= useNavigate()

  const handleLogout=()=>{
    navigate("/login")
  }


  return (
    <header className="bg-gray-900 p-4 flex justify-between items-center">
      <h1 className="text-xl font-bold text-white">NextMarket</h1>
      <h3 className="text-white">
        Cantidad:{totalCantidad} - Balance: {balances} $
      </h3>
      <button 
      className="bg-purple-600 text-white px-4 py-2 rounded-lg hover:bg-purple-700 transition"
       onClick={handleLogout}>
        Logout
        {}
      </button>

      <button
        className="relative p-2 text-white"
        onClick={() => setCartOpen(!cartOpen)}
      >
        <ShoppingCart size={24} />
      </button>

      {cartOpen && (
        <div className="absolute top-16 right-4 bg-white text-black p-4 shadow-lg rounded-lg w-64">
          {carrito.length > 0 ? (
            <ul>
              {carrito.map((producto) => (
                <li
                  key={producto.name}
                  className="flex justify-between border-b py-2"
                >
                  <span>{producto.name}</span>
                  <span className="font-bold">x{producto.cantidad}</span>
                </li>
              ))}
            </ul>
          ) : (
            <p className="text-center text-gray-500">Carrito vacío</p>
          )}
        </div>
      )}
    </header>
  );
};

export default Header;
