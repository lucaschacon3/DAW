import { useState, useEffect } from "react";
import Login from "./components/loginComponents/Login";
import { AuthProvider } from "./components/loginComponents/AuthProvider";
import {BrowserRouter as Router, Routes, Route} from "react-router-dom";
import RutaProtegidas from "./components/loginComponents/RutasProtegidas";
import Header from "./components/Header";
import Body from "./components/Body";
import ServicioCryptos from "./service/servicioCryptos";

function App() {

  useEffect(() => {
    ServicioCryptos.getAll()
      .then((response) => {
        setCryptosInfo(response.data);
      })
      .catch((error) => {
        alert("Tienes internet?")
      });
  }, []);

  const [balances, setBalances] = useState(0);
  const [carrito, setCarrito] = useState([]);
  const [cryptosInfo, setCryptosInfo]=useState([]);

 

  return (
    <>
      <AuthProvider>
        <Routes>
          <Route
          path="/"
          element={<RutaProtegidas>
            <Header  balances={balances} carrito={carrito}/>
            <Body cryptosInfo={cryptosInfo} balances={balances} setBalances={setBalances} carrito={carrito} setCarrito={setCarrito}/>
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
