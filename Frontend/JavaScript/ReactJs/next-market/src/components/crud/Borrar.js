import ServicioCryptos from "../../service/servicioCryptos";
import Swal from "sweetalert2";

const ContactoBorrar = (contacto, contactos, setContactos) => {
  Swal.fire({
    title: "¿Estás seguro?",
    text: "No podrás revertir esta acción",
    icon: "warning",
    showCancelButton: true,
    confirmButtonColor: "#d33",
    cancelButtonColor: "#3085d6",
    confirmButtonText: "Sí, eliminar",
    cancelButtonText: "Cancelar",
  }).then((result) => {
    if (result.isConfirmed) {
      // Llamada al servicio para eliminar el contacto
      ServicioContactos.delete(contacto.id)
        .then(() => {
          Swal.fire("Contacto borrado correctamente");

          // Filtrar el contacto eliminado de la lista
          const nuevosContactos = contactos.filter((c) => c.id !== contacto.id);

          // Actualizar el estado local
          setContactos(nuevosContactos);

          Swal.fire(
            "¡Eliminado!",
            "El contacto ha sido eliminado.",
            "success"
          );
        })
        .catch(() => {
          Swal.fire("ERROR, No se ha borrado el contacto");
        });
    }
  });
};

export default ContactoBorrar;
