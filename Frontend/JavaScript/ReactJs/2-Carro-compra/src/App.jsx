import { useState } from "react";
import Menu from "./components/Menu";
import Cuerpo from "./components/Cuerpo";
import Pagina404 from "./components/Pagina404";
import Detalles from "./components/Detalles";
import DetallesProducto from "./components/DetallesProducto";
import { BrowserRouter, Route, Routes } from "react-router-dom";

function App() {
  const [total, setTotal] = useState(0); // Estado para el importe total
  const [productos, setProductos] = useState([]); // Lista de productos del carrrito

  // Datos de imágenes
  const informacion = [
    { url: "./imagenes/manzana.jpg", nombre: "Manzana", precio: 5 },
    { url: "./imagenes/pera.jpg", nombre: "Pera", precio: 7 },
    { url: "./imagenes/platano.jpg", nombre: "Platano", precio: 4 },
  ];

  return (
    <BrowserRouter>
      <div className="App">
        <header className="App-header">
          {/* Pasar el total al menú superior */}
          <Menu total={total} productos={productos} />
        </header>
        <main>
          <Routes>
            <Route path="*" element={<Pagina404 />}></Route>
            <Route
              path="/"
              element={
                <Cuerpo
                  total={total}
                  setTotal={setTotal}
                  productos={productos}
                  setProductos={setProductos}
                  informacion={informacion}
                />
              }
            ></Route>
            <Route path="/detalles" element={<Detalles productos={productos} informacion={informacion} />}></Route>
            <Route path="/detalle-producto/:nombre" element={<DetallesProducto productos={productos} informacion={informacion}/>}></Route>
          </Routes>
        </main>
      </div>
    </BrowserRouter>
  );
}

export default App;
