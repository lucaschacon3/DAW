import React, { useState } from "react";
import { ShoppingCart } from "lucide-react";

const Header = ({agregarAlCarrito,cryptos, balances, setBalances}) => {
  const [cartOpen, setCartOpen] = useState(false);

  function calculaCantidadTotal() {
    return balances.BTC+balances.ETH+balances.BNB+ balances.ADA
  }

  function calculaPrecioTotal() {
    return cryptos.reduce((total, crypto) => {
      return total + balances[crypto.symbol] * crypto.price;
    }, 0);
  }
  

  return (
    <header className="bg-gray-900 p-4 flex justify-between items-center">
      <h1 className="text-xl font-bold text-white">NextMarket</h1>
      <h3 className="text-white">Cantidad: {calculaCantidadTotal()} - Balance: {calculaPrecioTotal()} $</h3>
      <button className="bg-purple-600 text-white px-4 py-2 rounded-lg hover:bg-purple-700 transition">
        Logout
      </button>
  

      <button
        className="relative p-2 text-white"
        onClick={() => setCartOpen(!cartOpen)}
      >
        <ShoppingCart size={24} />
      </button>

      {cartOpen && (
        <div className="absolute top-16 right-4 bg-white text-black p-4 shadow-lg rounded-lg">
          <p>Carrito vacío</p>
        </div>
      )}
    </header>
  );
};

export default Header;
