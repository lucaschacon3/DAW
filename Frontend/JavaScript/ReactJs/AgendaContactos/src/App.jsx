import { useState, useEffect } from "react";
import Header from "./components/Header";
import Body from "./components/Body";
import Swal from "sweetalert2";
import ServicioContactos from "./services/servicioContactos";

function App() {

  const [contactos, setContactos] = useState([])

  useEffect(() => {
    ServicioContactos.getAll()
      .then((response) => {
        setContactos(response.data);
      })
      .catch((error) => {
        Swal.fire({
          title: "¿Tienes Internet?",
          text: "No consigo descargar los contactos",
          icon: "question",
        });
      });
  }, []);
  return (
    <>
      <Header contactos={contactos}></Header>
      <Body contactos={contactos} setContactos={setContactos}>
      </Body>

    </>
  );
}

export default App;
