import { useState, useEffect } from "react";
import SessionStorageServicio from "./storage.js"

function UseStorageState(clave, valorInicial) {
  const [state, setState] = useState(() => {
    
    // Recupera el valor inicial desde localStorage o usa el valor predeterminado
    const valorGuardado = SessionStorageServicio.get(clave);
    return valorGuardado !== null ? valorGuardado : valorInicial;
  });

  useEffect(() => {

    // Guarda el estado en localStorage cada vez que cambie
    SessionStorageServicio.set(clave, state);
    
  }, [clave, state]);

  return [state, setState];
}

export default UseStorageState;
