import React, { useState } from "react";



const Body = ({cryptos, balances, setBalances}) => {
  

  const handleTransaction = (symbol, type) => {
    setBalances((prevBalances) => ({
      ...prevBalances,
      [symbol]: type === "buy" ? prevBalances[symbol] + 1 : Math.max(prevBalances[symbol] - 1, 0),
    }));
  };

  return (
    <div className="p-8 grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-4">
      {cryptos.map((crypto) => (
        <div key={crypto.symbol} className="bg-gray-900 text-white p-6 rounded-lg shadow-md text-center">
          <h3 className="text-xl font-semibold">{crypto.name} ({crypto.symbol})</h3>
          <p className="text-gray-400">${crypto.price.toLocaleString()}</p>
          <img src={crypto.url} alt="" width="150px" className="mx-auto" />

          <p className="mt-2">Balance: {balances[crypto.symbol]}</p>
          <div className="flex justify-center mt-4 space-x-2">
            <button 
              className="bg-green-500 text-white px-4 py-2 rounded-lg hover:bg-green-600 transition"
              onClick={() => handleTransaction(crypto.symbol, "buy")}
            >
              Comprar
            </button>
            <button 
              className="bg-red-500 text-white px-4 py-2 rounded-lg hover:bg-red-600 transition"
              onClick={() => handleTransaction(crypto.symbol, "sell")}
            >
              Vender
            </button>
          </div>
        </div>
      ))}
    </div>
  );
};

export default Body;