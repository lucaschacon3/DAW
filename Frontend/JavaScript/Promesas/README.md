Sirve para controlar que cargen diferentes tipos de archivos como ficheros json o imágenes

```jsx
let ruta = "autores.json";

fetch(ruta)
  .then((response) => {
    if (!response.ok) {
      throw new Error(`HTTP error, status = ${response.status}`);
    }
    return response.json();
  })
  .then((data) => {
    main(data); //aqui va el programa principal (se le pasa contenido del fichero)
  })
  .catch((error) => {
	  alert(`Error: ${error.message}`);
	  // o ponemos alerta de la libreria swetalert
    Swal.fire({ 
      icon: "error",
      title: "Oops...",
      text: "Something went wrong!",
      footer: '<a href="#">Why do I have this issue?</a>'
    });
  });
```