import { useState } from "react";
import MenuSuperior from "./componentes/menu";
import ListaImagenes from "./componentes/cuerpo";
import Pagina404 from "./componentes/Pagina404";
import Detalles from "./componentes/detalles";
import { BrowserRouter, Route, Routes } from "react-router-dom";

function App() {
  const [total, setTotal] = useState(0); // Estado para el importe total
  const [productos, setProductos] = useState([]); // Lista de productos del carrrito

  // Datos de imágenes
  const imageUrls = [
    { url: "./imagenes/manzana.jpg", nombre: "Manzana", precio: 5 },
    { url: "./imagenes/pera.jpg", nombre: "Pera", precio: 7 },
    { url: "./imagenes/platano.jpg", nombre: "Platano", precio: 4 },
  ];

  return (
    <BrowserRouter>
      <div className="App">
        <header className="App-header">
          {/* Pasar el total al menú superior */}
          <MenuSuperior total={total} productos={productos} />
        </header>
        <main>
          <Routes>
            <Route path="*" element={<Pagina404 />}></Route>
            <Route
              path="/"
              element={
                <ListaImagenes
                  total={total}
                  setTotal={setTotal}
                  productos={productos}
                  setProductos={setProductos}
                />
              }
            ></Route>
            <Route path="/detalles" element={<Detalles imageUrls={imageUrls} />}></Route>
          </Routes>
        </main>
      </div>
    </BrowserRouter>
  );
}

export default App;
