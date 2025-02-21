import { useState, useEffect } from "react";
import Login from "./components/loginComponents/Login";
import { AuthProvider } from "./components/loginComponents/AuthProvider";
import { BrowserRouter as Router, Routes, Route } from "react-router-dom";
import RutasProtegidas from "./components/loginComponents/RutasProtegidas";
import Header from "./components/Header";
import Body from "./components/Body";
import ServicioCryptos from "./service/servicioCryptos";
import DetalleCarrito from "./components/DetalleCarrito";
import DetalleProducto from "./components/DetalleProducto";
import Admin from "./components/Admin";
import Register from "./components/Register";

function App() {
  // balance se puede meter en localstorage: UseStorageState("balance", 0)
  const [balance, setBalance] = useState(0);
  // carrito se podria guardar en localstorage: UseStorageState("carrito", [])
  const [carrito, setCarrito] = useState([]);
  const [cryptosInfo, setCryptosInfo] = useState([]);

  const[notificaciones, setNotificaciones]=useState(false);

  useEffect(() => {
    ServicioCryptos.getAll()
      .then((response) => {
        setCryptosInfo(response.data);
      })
      .catch((error) => {
        alert("Tienes internet?");
      });
  }, []);

  return (
    <>
      <AuthProvider>
        <Routes>
          <Route
            path="/"
            element={
              <RutasProtegidas>
                <Header balance={balance} carrito={carrito} />
                <Body
                  cryptosInfo={cryptosInfo}
                  setBalance={setBalance}
                  carrito={carrito}
                  setCarrito={setCarrito}
                  notificaciones={notificaciones}
                />
              </RutasProtegidas>
            }
          />

          <Route path="/login" element={<Login setNotificaciones={setNotificaciones} />} />

          <Route
            path="/detalle-carrito"
            element={
              <RutasProtegidas>
                <DetalleCarrito
                  carrito={carrito}
                  setCarrito={setCarrito}
                  informacion={cryptosInfo}
                />
              </RutasProtegidas>
            }
          />

          <Route
            path="/detalle-producto/:nombre"
            element={
              <RutasProtegidas>
                <DetalleProducto informacion={cryptosInfo} />
              </RutasProtegidas>
            }
          />

          <Route path="/register" element={<Register/>}/>
          <Route
            path="/admin"
            element={<Admin carrito={carrito} setCarrito={setCarrito}/>}
          />
        </Routes>
      </AuthProvider>
    </>
  );
}

export default App;
