import React from 'react';
import { Navigate } from 'react-router-dom';
import { useAuth } from './AuthProvider';

const RutaProtegida = ({ children }) => {
  const { user } = useAuth();
  //si user existe (true) devuelve children
  return user ? children : <Navigate to="/login" />;
};

export default RutaProtegida;
