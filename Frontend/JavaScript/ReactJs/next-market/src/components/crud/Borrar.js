import ServicioCryptos from "../../service/servicioCryptos";
import Swal from "sweetalert2";

const CryptoBorrar = (crypto, cryptosInfo, setCryptosInfo) => {
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
      
      ServicioCryptos.delete(crypto.id)
        .then(() => {
          Swal.fire("Crypto borrada correctamente");

          const nuevasCryptos = cryptosInfo.filter((c) => c.id !== crypto.id);

          setCryptosInfo(nuevasCryptos);

          Swal.fire(
            "¡Eliminado!",
            "La crypto ha sido eliminada.",
            "success"
          );
        })
        .catch(() => {
          Swal.fire("ERROR, No se ha borrado la crypto");
        });
    }
  });
};

export default CryptoBorrar;
