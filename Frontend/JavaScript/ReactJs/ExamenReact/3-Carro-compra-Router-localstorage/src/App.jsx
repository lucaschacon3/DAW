import { useState, useEffect } from 'react'
import MenuSuperior from './componentes/menu'
import ListaImagenes from './componentes/cuerpo'
import DetalleCarrito from './componentes/DetalleCarrito'

import {Routes, Route } from 'react-router-dom';
import Pagina404 from './componentes/Pagina404';
import DetalleProducto from './componentes/DetalleProducto';
import UseStorageState from './servicios/UseStorageState';
import servicioProductos from './servicios/servicioProductos';



function App() {
  
  /*
    const informacion = [ 
    { url: "/imagenes/ajos.jpeg", nombre: "Ajos", precio: 7.15 }, 
    { url: "/imagenes/aceitunas.jpeg", nombre: "Aceitunas", precio: 8.99 }, 
    { url: "/imagenes/calabacin.jpg", nombre: "Calabacin", precio: 1.99 },
    { url: "/imagenes/calabaza.jpg", nombre: "Calabaza", precio: 3.17 }
  ]; */


  const [informacion, setInformacion]=useState([])

  useEffect(() => {
    servicioProductos.getAll()
      .then((response) => {
        setInformacion(response.data);
      })
      .catch((error) => {
        alert("Tienes internet?")
      });
  }, []);

  const [total, setTotal] = UseStorageState("total", 0); // Estado para el importe total
  const [productos, setProductos] = UseStorageState("productos",[]); // Lista de productos del carrrito
  

  return (

    
    <div className="App">
      <header className="App-header">
        {/* Pasar el total al menú superior */}
        <MenuSuperior 
            total={total} 
            productos={productos}
                  />
      </header>
      <main>
      <Routes>
            {/* Ruta principal con ListaImagenes */}
            <Route 
              path="/" 
              element={<ListaImagenes total={total} setTotal={setTotal} productos={productos} setProductos={setProductos} informacion={informacion}/>} 
            />
            
            {/* Detalle del carrito de la compra */}
            <Route path="/detalle-carrito" element={<DetalleCarrito productos={productos} setProductos={setProductos} total={total} setTotal={setTotal}/>} />

            <Route path="/producto/:nombre" element={<DetalleProducto informacion={informacion}/>} />
            
            <Route path="*" element={<Pagina404 />} />

            

          </Routes>
      </main>
    </div>
  
  );
}

export default App
