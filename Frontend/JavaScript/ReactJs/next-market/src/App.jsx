import { useState } from "react";
import Login from "./components/loginComponents/Login";
import { AuthProvider } from "./components/loginComponents/AuthProvider";
import {BrowserRouter as Router, Routes, Route} from "react-router-dom";
import RutaProtegidas from "./components/loginComponents/RutasProtegidas";
import Header from "./components/Header";
import Body from "./components/Body";

function App() {

  const cryptos = [
    { name: "Bitcoin", symbol: "BTC", price: 45000, url:"https://upload.wikimedia.org/wikipedia/commons/thumb/4/46/Bitcoin.svg/1024px-Bitcoin.svg.png" },
    { name: "Ethereum", symbol: "ETH", price: 3200, url: "https://cryptologos.cc/logos/ethereum-eth-logo.png" },
    { name: "Binance Coin", symbol: "BNB", price: 400, url:"https://cryptologos.cc/logos/bnb-bnb-logo.png" },
    { name: "Cardano", symbol: "ADA", price: 1.25, url:"https://cdn4.iconfinder.com/data/icons/crypto-currency-and-coin-2/256/cardano_ada-512.png" },
  ];


  const [balances, setBalances] = useState({ BTC: 0, ETH: 0, BNB: 0, ADA: 0 });
  const [carrito, setCarrito] = useState({});

 

  return (
    <>
      <AuthProvider>
        <Routes>
          <Route
          path="/"
          element={<RutaProtegidas>
            <Header cryptos={cryptos} balances={balances} setBalances={setBalances}/>
            <Body cryptos={cryptos} balances={balances} setBalances={setBalances}/>
          </RutaProtegidas>}>
            
          </Route>

          <Route 
          path="/login"
          element={<Login/>}>
            
          </Route>
        </Routes>
      </AuthProvider>
    </>
  );
}

export default App;
