import { useState, useEffect } from "react";
import ServicioTareas from "./services/servicioTareas";
import Modal from './Modal'
import Crear from './Crear'

function App() {
  const [tareas, setTareas] = useState([]);
    const [modals, setModals] = useState({
      crear: false,
      consultar: false,
      editar: false,
    });

  // Obtener todas las tareas al montar el componente
  useEffect(() => {
    ServicioTareas.getAll()
      .then((response) => {
        setTareas(response.data);
      })
      .catch((error) => {
        alert("ERROR");
      });
  }, []);

  // Función para eliminar una tarea por título
  function eliminarTarea(tituloTarea) {
    setTareas((prevTareas) =>
      prevTareas.filter((tarea) => tarea.titulo !== tituloTarea)
    );
  }

  const gestionarModal = (tipoModal, estadoAbierto) => {
    setModals((prevModals) => ({
      ...prevModals,
      [tipoModal]: estadoAbierto,
    }));
  };
  const crear = () => {
    gestionarModal("crear", true);
  };

  return (
    <>
      <ul>
        {tareas.map((tarea, index) => {
          return (
            <li key={index}>
              {tarea.titulo} : {tarea.contenido}{" "}
              <button onClick={() => eliminarTarea(tarea.titulo)}>
                Eliminar
              </button>
            </li>
          );
        })}
      </ul>
      <button onClick={crear}>Añadir</button>

      <Modal
        isOpen={modals.crear}
        onClose={() => gestionarModal("crear", false)}
      >
        <Crear
          tareas={tareas}
          setTareas={setTareas}
          onClose={() => gestionarModal("crear", false)}
        />
      </Modal>
    </>
  );
}

export default App;
