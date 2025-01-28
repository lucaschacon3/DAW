import { useState } from 'react'
import Menu from './componentes/Menu'
import Cuerpo from './componentes/Cuerpo'
import { Routes, Route } from 'react-router-dom';
import Pagina404 from './componentes/Pagina404';
import DetalleCarrito from './componentes/DetalleCarrito';
import DetalleProducto from './componentes/DetalleProducto';
import useStorageState from './servicios/UseStorageState';


function App() {

  const informacion = [ 
    { url: "/imagenes/manzana.jpg", nombre: "Manzana", precio: 5 }, 
    { url: "/imagenes/pera.jpg", nombre: "Pera", precio: 7 }, 
    { url: "/imagenes/platano.jpg", nombre: "Platano", precio: 4 } 
  ];
  //const [total, setTotal] = useState(0);  Estado para el importe total
  const [total, setTotal] = useStorageState("total", 0)
  const [productos, setProductos] = useStorageState("productos",[]); // Lista de productos del carrrito
  const [productosJson, setProductosJson] = useState([]); 

  return (
    <div className="App">

      <header className="App-header">
        {/* Pasar el total al menú superior */}
        <Menu
          total={total}
          productosJson={productosJson}
          setProductosJson={setProductosJson}
        />
      </header>
      <main>
        <Routes>
          <Route path='/'
            element={<Cuerpo total={total} setTotal={setTotal} productos={productos} setProductos={setProductos} informacion={informacion} productosJson={productosJson} setProductosJson={setProductosJson}/>} />

          <Route path='/detalle-carrito' element={<DetalleCarrito productos={productos} informacion={informacion} productosJson={productosJson}/>}/>

          <Route path='/detalle-producto/:nombre' element={<DetalleProducto informacion={informacion} />} />
          <Route path='*' element={<Pagina404 />} />

        </Routes>

      </main>
    </div>
  );
}

export default App
