import { useParams, Link } from "react-router-dom";

const DetalleProducto = ({ informacion }) => {
  const { nombre } = useParams(); // Obtener el nombre desde la URL
  const producto = informacion.find((p) => p.nombre.toLowerCase() === nombre.toLowerCase());

  if (!producto) {
    return (
      <div className="text-center text-gray-500 text-xl mt-10">
        Producto no encontrado
        <Link to="/" className="block mt-4 text-cyan-500 hover:text-cyan-600">
          Volver a la tienda
        </Link>
      </div>
    );
  }

  return (
    <div className="flex flex-col items-center justify-center h-screen">
      <h2 className="text-2xl font-bold mb-4">{producto.nombre}</h2>
      <img src={producto.url} alt={producto.nombre} className="w-48 h-48 rounded-lg shadow-md" />
      
      <Link
        to="/"
        className="mt-6 bg-cyan-500 text-white px-4 py-2 rounded-md hover:bg-cyan-600 transition"
      >
        Volver a la Tienda
      </Link>
    </div>
  );
};

export default DetalleProducto;
