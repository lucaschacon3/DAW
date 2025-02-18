import React, { useState } from "react";
import Modal from '../components/Modal';
import Crear from './crud/Crear';
import Consultar from './crud/Consultar';
import Editar from './crud/Editar';
import ContactoBorrar from './crud/Borrar'; // Asegúrate de importar la función de borrar contacto

const Admin = ({ contactos, setContactos }) => {
  const [modals, setModals] = useState({
    crear: false,
    consultar: false,
    editar: false,
  });
  const [contactoSeleccionado, setContactoSeleccionado] = useState(null);

  const gestionarModal = (tipoModal, estadoAbierto) => {
    setModals((prevModals) => ({
      ...prevModals,
      [tipoModal]: estadoAbierto,
    }));
  };

  const consultar = (contacto) => {
    setContactoSeleccionado(contacto);
    gestionarModal("consultar", true);
  };

  const editar = (contacto) => {
    setContactoSeleccionado(contacto);
    gestionarModal("editar", true);
  };

  const crear = () => {
    gestionarModal("crear", true);
  };

  const borrar = (contacto) => {
    ContactoBorrar(contacto, contactos, setContactos); // Llamada para borrar el contacto
  };

  return (
    <div className="body">
      <ul>
        {contactos.length > 0 ? (
          contactos.map((contacto) => (
            <li key={contacto.id}>
              <div className="caja-contacto">
                <strong>{contacto.nombre}</strong>: {contacto.numero}
                <button onClick={() => consultar(contacto)}>
                  Consultar
                </button>
                <button onClick={() => borrar(contacto)}>Borrar</button>
                <button onClick={() => editar(contacto)}>Editar</button>
              </div>
            </li>
          ))
        ) : (
          <p>No se encontraron contactos.</p>
        )}
      </ul>
      <button onClick={crear}>Añadir</button>

      <Modal
        isOpen={modals.crear}
        onClose={() => gestionarModal("crear", false)}
      >
        <Crear
          contactos={contactos}
          setContactos={setContactos}
          onClose={() => gestionarModal("crear", false)}
        />
      </Modal>

      <Modal
        isOpen={modals.consultar}
        onClose={() => gestionarModal("consultar", false)}
      >
        {contactoSeleccionado && (
          <Consultar contacto={contactoSeleccionado} />
        )}
      </Modal>

      <Modal
        isOpen={modals.editar}
        onClose={() => gestionarModal("editar", false)}
      >
        {contactoSeleccionado && (
          <Editar
            contacto={contactoSeleccionado}
            setContactos={setContactos}
            onClose={() => gestionarModal("editar", false)}
          />
        )}
      </Modal>
    </div>
  );
};

export default Admin;
