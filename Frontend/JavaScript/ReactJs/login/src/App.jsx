import { useState } from "react";
import Login from "./components/Login";
import { AuthProvider } from "./components/AuthProvider";
import {BrowserRouter as Router, Routes, Route} from "react-router-dom";
import RutaProtegida from "./components/RutasProtegidas";
import ComponentePrincipal from "./components/ComponentePrincipal";

function App() {
  return (
    <>
      <AuthProvider>
        <Routes>
          <Route
          path="/"
          element={<RutaProtegida>
            <ComponentePrincipal/>
          </RutaProtegida>}>
            
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
