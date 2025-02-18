import React, { createContext, useContext, useState } from "react";
import UseStorageState from "../service/UseStorageState";

const AuthContext = createContext();

export const AuthProvider = ({ children }) => {
  const [user, setUser] = UseStorageState("user",null);

  const login = (userData) => setUser(userData); // Ahora almacena el objeto completo
  const logout = () => setUser(null);

  return (
    <AuthContext.Provider value={{ user, login, logout }}>
      {children}
    </AuthContext.Provider>
  );
};

export const useAuth = () => useContext(AuthContext);
