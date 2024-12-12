/**
 *
 * index.html tiene enlazado main.jsx
 * main.jsx tiene como componente App.jsx
 * App.jsx es el componente principal (tiene hijos)
 * Los hijos pueden ser menu.jsx y cuerpo.jsx
 * Los hijos tienen variables compartidas con App.js
 * Esto es App.jsx
 *
 */

//importar estilos
import "./styles/App.css";
import "./estilos/cuerpo.css";

import React, { useState } from "react";

//importar componentes
import MenuSuperior from "./componentes/menuSuperior";
import Cuerpo from "./componentes/cuerpo";

//nombre de componente (funcion)
function App() {
  // variables para los componentes
  const [total, setTotal] = useState(0); // Estado para el importe total
  const [productos, setProductos] = useState([]); // Lista de productos del carrrito

  // solo se puede devolver una etiqueta por eso se pone el html entre <></>
  return (
    <>
      <div className="App">
        <header className="App-header">
          {/* Pasar el total al Menu(componente) */}
          <MenuSuperior total={total} productos={productos} />
        </header>
        <main>
          {/* Pasar total y setTotal para atualizarlo */}
          <Cuerpo
            total={total}
            setTotal={setTotal}
            productos={productos}
            setProductos={setProductos}
          />
        </main>
      </div>
    </>
  );
}

//exportar componente
export default App;




