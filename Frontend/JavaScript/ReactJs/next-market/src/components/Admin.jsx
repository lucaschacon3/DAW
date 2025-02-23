import React, { useState } from "react";
import Modal from "../components/Modal";
import Crear from "./crud/Crear";
import Consultar from "./crud/Consultar";
import Editar from "./crud/Editar";
import CryptoBorrar from "./crud/Borrar";

const Admin = ({ cryptosInfo, setCryptosInfo }) => {
  const [modals, setModals] = useState({
    crear: false,
    consultar: false,
    editar: false,
  });
  const [cryptoSeleccionado, setCryptoSeleccionado] = useState(null);

  const gestionarModal = (tipoModal, estadoAbierto) => {
    setModals((prevModals) => ({
      ...prevModals,
      [tipoModal]: estadoAbierto,
    }));
  };

  const consultar = (crypto) => {
    setCryptoSeleccionado(crypto);
    gestionarModal("consultar", true);
  };

  const editar = (crypto) => {
    setCryptoSeleccionado(crypto);
    gestionarModal("editar", true);
  };

  const crear = () => {
    gestionarModal("crear", true);
  };

  const borrar = (crypto) => {
    CryptoBorrar(crypto, cryptosInfo, setCryptosInfo);
  };

  return (
    <div className="p-6 bg-gray-100 min-h-screen" id="body">
      <ul className="space-y-4">
        {cryptosInfo.length > 0 ? (
          cryptosInfo.map((crypto) => (
            <li key={crypto.id} className="p-4 bg-white rounded-lg shadow-md flex justify-between items-center">
              <div>
                <strong className="text-lg font-semibold">{crypto.nombre}</strong>: {crypto.precio}$
              </div>
              <div className="space-x-2">
                <button 
                  className="px-3 py-1 bg-blue-500 text-white rounded hover:bg-blue-600" 
                  onClick={() => consultar(crypto)}
                >
                  Consultar
                </button>
                <button 
                  className="px-3 py-1 bg-red-500 text-white rounded hover:bg-red-600" 
                  onClick={() => borrar(crypto)}
                >
                  Borrar
                </button>
                <button 
                  className="px-3 py-1 bg-green-500 text-white rounded hover:bg-green-600" 
                  onClick={() => editar(crypto)}
                >
                  Editar
                </button>
              </div>
            </li>
          ))
        ) : (
          <p className="text-gray-600">No se encontraron cryptos.</p>
        )}
      </ul>
      <button 
        className="mt-4 px-4 py-2 bg-purple-500 text-white rounded hover:bg-purple-600"
        onClick={crear}
      >
        Añadir
      </button>

      <Modal isOpen={modals.crear} onClose={() => gestionarModal("crear", false)}>
        <Crear
          cryptosInfo={cryptosInfo}
          setCryptosInfo={setCryptosInfo}
          onClose={() => gestionarModal("crear", false)}
        />
      </Modal>

      <Modal isOpen={modals.consultar} onClose={() => gestionarModal("consultar", false)}>
        {cryptoSeleccionado && <Consultar crypto={cryptoSeleccionado} />}
      </Modal>

      <Modal isOpen={modals.editar} onClose={() => gestionarModal("editar", false)}>
        {cryptoSeleccionado && (
          <Editar
            crypto={cryptoSeleccionado}
            setCryptosInfo={setCryptosInfo}
            onClose={() => gestionarModal("editar", false)}
          />
        )}
      </Modal>
    </div>
  );
};

export default Admin;
