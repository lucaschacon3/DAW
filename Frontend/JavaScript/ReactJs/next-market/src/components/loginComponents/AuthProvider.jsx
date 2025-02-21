import React, { createContext, useContext } from "react";
import UseStorageState from "../../service/UseStorageState";

const AuthContext = createContext();

export const AuthProvider = ({ children }) => {
  const [user, setUser] = UseStorageState("user", null);
  const [tempUser, setTempUser] = React.useState(null);

  const login = (userData, remember) => {
    if (remember) {
      setUser(userData);
    } else {
      setTempUser(userData);
    }
  };

  const logout = () => {
    setUser(null);
    setTempUser(null);
  };

  return (
    <AuthContext.Provider value={{ user: user || tempUser, login, logout }}>
      {children}
    </AuthContext.Provider>
  );
};

export const useAuth = () => useContext(AuthContext);
