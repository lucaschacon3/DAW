import { useState } from 'react'
import Menu from './componentes/Menu'
import Cuerpo from './componentes/Cuerpo'
import { Routes, Route } from 'react-router-dom';
import DetalleCarrito from './componentes/DetalleCarrito';
import DetalleProducto from './componentes/DetalleProducto';


function App() {

  const informacion = [ 
    { url: "/imagenes/manzana.jpg", nombre: "Manzana", precio: 5 }, 
    { url: "/imagenes/pera.jpg", nombre: "Pera", precio: 7 }, 
    { url: "/imagenes/platano.jpg", nombre: "Platano", precio: 4 } 
  ];
  //const [total, setTotal] = useState(0);  Estado para el importe total
  const [total, setTotal] = useState(0)
  const [productosJson, setProductosJson] = useState([]); 

  return (
    <div className="App">

      <header className="App-header">
        {/* Pasar el total al menú superior */}
        <Menu
          total={total}
          setTotal={setTotal}
          productosJson={productosJson}
          setProductosJson={setProductosJson}
        />
      </header>
      <main>
        <Routes>
          <Route path='/'
            element={<Cuerpo total={total} setTotal={setTotal} informacion={informacion} productosJson={productosJson} setProductosJson={setProductosJson}/>} />

          <Route path='/detalle-carrito' element={<DetalleCarrito informacion={informacion} productosJson={productosJson} setProductosJson={setProductosJson}/>}/>

          <Route path='/detalle-producto/:nombre' element={<DetalleProducto informacion={informacion} />} />

        </Routes>

      </main>
    </div>
  );
}

export default App
