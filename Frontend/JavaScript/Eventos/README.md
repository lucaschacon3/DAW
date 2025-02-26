## Principales eventos

- onfocus: Al obtener un foco.
- onblur: Al salir del foco de un elemento.
- onchange: Al hacer un cambio en un elemento.
- onclick: Al hacer un click en el elemento.
- onkeydown: Al pulsar una tecla (sin soltarla).
- onkeyup: Al soltar una tecla pulsada.
- onkeypress: Al pulsar una tecla.
- onload: Al cargarse una página.
- onunload: Al descargarse una página (salir de ella).
- onmousedown: Al hacer clic de ratón (sin soltarlo).
- onmouseup: Al soltar el botón del ratón previamente pulsado.
- onmouseover: Al entrar encima de un elemento con el ratón.
- onmouseout: Al salir de encima de un elemento con el ratón.
- onsubmit: Al enviar los datos de un formulario.
- onreset: Al resetear los datos de un formulario.
- onselect: Al seleccionar un texto.
- onresize: Al modificar el tamaño de la página del navegador.

## Eventos de raton

- Click → onclick.
- Dblclick → ondblclick.
- Mousedown → onmousedown.
- Mouseup → onmouseup.
- Mouseover →onmouseover.
- Mouseout →onmouseout.
- Mousemove → onmousemove.
- Mouseenter →onmouseenter.
- Mouseleave →onmouseleave.
- Contextmenu → oncontextmenu.
- wheel → onwheel.

## Eventos de teclado

- Keydown → onkeydown.
- Keyup → onkeyup.
- Keypress → onkeypress.
- El objeto event contiene las siguientes propiedades para los eventos de teclado:
    - altKey → Devuelve true si la tecla alt se ha pulsado.
    - code → Devuelve el código asociado a la tecla pulsada.
    - ctrlKey → Devuelve true si la tecla control se ha pulsado.
    - key → Devuelve la tecla pulsada.
    - shiftKey → Devuelve true si la tecla shift se ha pulsado.

## Eventos HTML

- Load → onload.
- Unload → onunload.
- Abort → onabort.
- Beforeunload → onbeforeunload.
- Resize →onresize.
- Scroll → onscroll.

## Crear Eventos

Los eventos se puede hacer de varias formas:

### Onclick - HTML

Desde el html (no recomendable porque estamos modificando el html que es trabajo de otro desarrollador).

```html
<IMG SRC="mundo.jpg" onclick="alert('Click en imagen');">
```

### Onclick - JavaScript

Asignarle a una variable un evento.

```jsx
function mostrarMensaje(){
	alert(“Hola”);
}
document.getElementById(“miObjeto”).onclick=mostrarMensaje;
```

### Event Listener

```jsx
let boton= document.querySelector(`button`)

boton.addEventListener(`click`, function agregarAleatorio() {
  //funcion
})
```

Los eventos al clickar un elemento:

```jsx
function crearElemento(tipo, contenido, padre) {
  let hijo = document.createElement(tipo);
  hijo.innerHTML = contenido;
  padre.appendChild(hijo);

	// para dos clicks usar dbclick
  hijo.addEventListener(`click`, function eliminar () { 
    this.remove();
  });
}
```

## Gestion de eventos

### Objeto this

Cuando ejecutas código dentro de un evento, existe un objeto llamado “this”. Este objeto es una referencia al elemento que ha producido el evento. 

Ejemplo, si hay un evento “click” a una imagen con id=”miImagen”, el objeto “this” será lo mismo que poner “document.getElementById(“miImagen”);

```jsx
<div id="cont" style="width:150px; height:60px; border:thin solid
silver" onmouseover=this.style.borderColor='black';" onmouseout="this.style.borderColor='red';">
 Hola
</div>
```

### Objeto event

Cuando se crea una función como manejador, al producirse el evento el navegador automáticamente manda como parámetro un objeto de tipo event.

```jsx
function mostrarMensaje(evento){
	alert(evento.type);
}
document.getElementById(“miObjeto”).onclick=mostrarMensaje;
```

Este objeto posee cierta información útil del evento que se ha producido.

- Type → dice el tipo de evento que es (“click”, “mouseover”, etc...). Devuelve el nombre del evento
tal cual, sin el “on”. Es útil para hacer una función que maneje varios eventos.
- KeyCode → en eventos de teclado, almacena el código de tecla de la tecla afectada por el evento.
- clientX / clientY → en eventos del ratón, devuelve las coordenadas X e Y donde se encontraba el
ratón, tomando como referencia al navegador.
- screenX / screenY → en eventos del ratón, devuelve las coordenadas X e Y donde se encontraba el
ratón, tomando como referencia la pantalla del ordenador.

```jsx
function mostrarMensaje(evento){
	if(evento.type==”keyup”){
		alert(evento.keyCode);
	}else if(evento.type==”click”){
		alert(evento.clientX+” “+evento.clientY);
	}
}
document.getElementById(“miObjeto”).onclick=mostrarMensaje;
document.onkeyup=mostrarMensaje;
```

```jsx
<input id="idBoton" type="button" onclick="decirHola(this)" /> // uso THIS
function decirHola(elemento) {
	alert("Has pulsado : " + elemento.id );
}
<input id="idBoton" type="button" onclick="decirHola(event)" /> // uso EVENT
function decirHola(e) {
	alert("elemento pulsado : " + e.target.id);
}
 document.getElementById("idhref").addEventListener("click", decirHola); // uso EVENT y THIS
function decirHola(e){
	e.preventDefault();
	alert("elemento pulsado : " + e.target.id);
	alert("elemento pulsado : " + this.id);
	
 }
```