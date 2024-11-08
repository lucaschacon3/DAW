const papel = document.getElementById("papel");
const papelera = document.getElementById("papelera");

// Evitar el comportamiento por defecto
papelera.addEventListener("dragover", (e) => e.preventDefault());

// Cambiar estado al soltar el papel sobre la papelera
papelera.addEventListener("drop", () => {
  papelera.classList.remove("vacía");
  papelera.classList.add("llena");

  papelera.remove();
  papel.remove();

  let img = document.createElement("img");
  img.src = "papeleraLLena.jpg";
  document.body.appendChild(img);

  img.addEventListener(`dblclick`, function recargar() {
    location.reload();
  });
});
