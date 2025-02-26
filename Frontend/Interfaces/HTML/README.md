### Estructura básica

- `<!DOCTYPE html>`: Define el tipo de documento como HTML5.
- `<html>`: Contenedor raíz de un documento HTML.
- `<head>`: Contiene metadatos sobre el documento, como el título y enlaces a recursos externos.
- `<title>`: Especifica el título del documento en la barra del navegador.
- `<body>`: Contiene el contenido visible del documento.

### Estructura semántica

- `<header>`: Define el encabezado de una página o sección.
- `<nav>`: Define un conjunto de enlaces de navegación.
- `<main>`: Indica el contenido principal del documento.
- `<section>`: Representa una sección genérica de contenido.
- `<article>`: Representa una unidad autocontenida de contenido.
- `<aside>`: Contenido relacionado con el contenido principal, como una barra lateral.
- `<footer>`: Define el pie de página de una página o sección.

### Texto y contenido multimedia

- `<h1>` a `<h6>`: Define encabezados de diferentes niveles.
- `<p>`: Define un párrafo.
- `<a>`: Crea un enlace.
- `<img>`: Inserta una imagen.
- `<video>`: Inserta un video.
- `<audio>`: Inserta un audio.
- `<figure>`: Agrupa contenido multimedia como imágenes y leyendas.
- `<figcaption>`: Proporciona una leyenda para un elemento `<figure>`.

### Formularios

- `<form>`: Contenedor para un formulario.
- `<input>`: Define un campo de entrada, puede variar según el tipo.
- `<label>`: Asocia un texto con un control de formulario.
- `<button>`: Crea un botón.
- `<select>`: Crea un menú desplegable.
- `<option>`: Define una opción dentro de un menú desplegable.
- `<optgroup>`: Agrupa opciones relacionadas dentro de un menú desplegable (`<select>`).
- `<textarea>`: Define un campo de texto multilínea.
- `<fieldset>`: Agrupa elementos de un formulario en bloques lógicos.
- `<legend>`: Proporciona un título para un conjunto de campos (`<fieldset>`).

### Tipos de `<input>`

- `type="text"`: Campo de texto.
- `type="password"`: Campo para introducir contraseñas.
- `type="email"`: Campo de entrada para correos electrónicos.
- `type="number"`: Campo para ingresar números.
- `type="date"`: Campo para seleccionar fechas.
- `type="radio"`: Botón de opción única.
- `type="checkbox"`: Casilla de verificación.
- `type="submit"`: Botón para enviar el formulario.
- `type="file"`: Campo para seleccionar un archivo.
- `type="range"`: Deslizador para seleccionar un valor numérico.
- Variables:
    - autofocus="autofocus" // que al refrescar se ponga el foco.
    - maxlength="20"
    - max="99999"
    - placeholder="Texto por defecto"
    - value="Texto ya escrito"
    - checked="checked" / “true”
    - disabled="disabled" / “true”
    - pattern="[0-9]{4} [0-9]{4} [0-9]{4} [0-9]{2} [0-9]{10}"
    - required

### Enlaces y navegación

- `<a>`: Define un enlace a otra página o recurso.
- `<link>`: Vincula recursos externos, como hojas de estilo CSS.
- `<nav>`: Define una sección de navegación con enlaces.

### Tablas

- `<table>`: Define una tabla.
- `<thead>`: Agrupa el encabezado de una tabla.
- `<tbody>`: Agrupa el cuerpo de la tabla.
- `<tfoot>`: Agrupa el pie de una tabla.
- `<tr>`: Define una fila de la tabla.
- `<th>`: Define una celda de encabezado.
- `<td>`: Define una celda de datos.

### Contenedores generales

- `<div>`: Define un contenedor genérico para agrupar contenido.
- `<span>`: Contenedor en línea para agrupar texto o elementos.

### Etiquetas multimedia y gráficos

- `<canvas>`: Define un espacio donde se pueden dibujar gráficos mediante JavaScript.
- `<svg>`: Define gráficos vectoriales escalables.