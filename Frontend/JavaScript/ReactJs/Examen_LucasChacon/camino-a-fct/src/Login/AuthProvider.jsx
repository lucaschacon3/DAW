import React, { createContext, useContext, useState } from 'react';
import UseStorageState from "../servicios/UseStorageState";
// createContext => Se usa para crear un contexto, que nos permitirá compartir información de autenticación entre distintos componentes.
// useContext => Permite acceder al contexto desde cualquier componente.


const AuthContext = createContext();


// AuthProvider es un componente proveedor que envolverá a otros componentes y les permitirá acceder al contexto.
export const AuthProvider = ({ children }) => {
  const [user, setUser] = UseStorageState("user", null)// para que no guarde: useState(null);

  const login = (userData) => setUser(userData);
  const logout = () => setUser(null);

  return (
    <AuthContext.Provider value={{ user, login, logout }}>
      {children}
    </AuthContext.Provider>
  );
};

//es un custom hook que facilita el acceso al contexto de autenticación.
export const useAuth = () => useContext(AuthContext);
