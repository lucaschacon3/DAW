import { useState, useEffect } from "react";
import { LocalStorageServicio } from "./localStorageServicio";

function useStorageState(clave, valorInicial) {
  const [state, setstate] = useState(() => {
    const valorGuardado = LocalStorageServicio.get(clave);
    if (valorGuardado !== null) {
      return valorGuardado;
    } else {
      return valorInicial;
    }
  });

  useEffect(() => {
    LocalStorageServicio.set(clave, state);
  }, [clave, state]);

  return [state, setstate];
}
export default useStorageState;
