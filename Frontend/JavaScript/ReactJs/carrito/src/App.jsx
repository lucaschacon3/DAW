import { useState } from "react";
import "./App.css";
import Menu from './components/Menu';

function App() {
  const [count, setCount] = useState(0);

  return (
    <>
      
      <Menu />
      <div id="idContenedor2">
        <div id="idProducto1">
          <h3>Manzana</h3>
          <div id="idImgManzana"></div>
          <div><h5>Precio: 3$</h5></div>
          <button id="idComprarManzana">Comprar</button>
        </div>
        
        
        <div id="idProducto1">
          <h3>Plátano</h3>
          <div id="idImgPlatano"></div>
          <div><h5>Precio: 5$</h5></div>
          <button id="idComprarPlatano">Comprar</button>
        </div>


        <div id="idProducto1">
          <h3>Pera</h3>
          <div id="idImgPera"></div>
          <div><h5>Precio: 4$</h5></div>
          <button id="idComprarPera">Comprar</button>
          
        </div>

      </div>
    </>
  );
}

export default App;
