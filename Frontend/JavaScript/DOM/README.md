- **Nodo**: El `<div>` en sí mismo es un nodo de tipo elemento, y el texto "Hola Mundo" es un nodo de texto.
- **Objeto**: `miDiv` en JavaScript sería un objeto `HTMLElement` con propiedades como `id`, `innerText`, etc.
- **Elemento**: `<div>` es un elemento dentro del DOM.

```jsx
<div id="miDiv">Hola Mundo</div>
```

### Atajos para obtener elementos

- document.documentElement: → Devuelve el nodo del elemento <html> (la etiqueta)
- document.head: → Devuelve el nodo del elemento <head>
- document.body: → Devuelve el nodo del elemento <body>
- document.title: → Devuelve el nodo del elemento <title>
- document.link: → Devuelve una colección con todos los hiperenlaces del documento
- document.anchor: → Devuelve una colección con todas las anclas del documento
- document.forms: → Devuelve una colección con todos los formularios del documento
- document.images: → Devuelve una colección con todas las imágenes del documento
- document.scripts: → Devuelve una colección con todos los scripts del documento

## Nodo tipo Element

Antes de nada tenemos que atrapar el elemento del HTML

- **getElementById(identificador)**: devuelve solo este elemento DOM (etiqueta html con las de dentro si es un div) para acceder al contenido hay que usar innerHTML.
    
    ```jsx
    let myDiv = document.getElementById(`miDiv`)
    alert(`El html de miDiv es ${myDiv.innerHTML}`)
    ```
    
- **getElementsByTagName(etiqueta)**: devuelve un HTMLCollection con todos los elementos DOM con misma etiqueta (No tiene muchos métodos, como el forEach, aunque se puede recorrer con un for)(cada elemento es un objeto que con innerHTML se accede al contenido).
    
    ```jsx
    let losh2 = document.getElementsByTagName('h2');
    let coleccion = [];
    
    for (let i = 0; i < losh2.length; i++) {
        coleccion[i] = losh2[i];
    }
    
    for (let i = 0; i < coleccion.length; i++) {
        console.log(`El elemento ${i} es : ${losh2[i].innerHTML}`)
        
    }
    
    coleccion.forEach((e,i)=>{console.log(`Elemento${i}: ${e.innerHTML}`)})
    ```
    
- **getElementsByClassName(nombre)**: devuelve un HTMLCollection con todos los elementos DOM con misma clase (No tiene muchos métodos, como el forEach, aunque se puede recorrer con un for)(cada elemento es un objeto que con innerHTML se accede al contenido).
    
    ```jsx
    let x = document.getElementsByClassName(`name`)
    ```
    
- **getElementsByName(nombre):** devuelve un NodeList con todos los elementos DOM con mismo nombre, que son objetos. En html sólo se puede poner name a los input por lo cual se puede usar para coger el value o cambiar el estado de un checkbox por ejemplo.
    
    ```jsx
    let byname=document.getElementsByName(`klk`)
    
    byname.forEach((e)=>{
        console.log(`${e.value}`)
    })
    ```
    
    ```jsx
    let x = document.getElementsByName(`name`)
    // Todos los checkbox que tengan de name alumnos, los marcamos
    for (let i = 0; i < x.length; i++) {
    	if (x[i].type == `checkbox`) {
    		 x[i].checked = true
    	}
    } 
    ```
    

### Propiedades de nodos tipo Element

- **elemento.innerHTML**: devuelve todo lo que hay en la etiqueta incluidas las etiquetas internas.
    
    ```jsx
    <p>Esta página es <strong>muy simple</strong></p>
    let contenido = elemento.innerHTML
    // contenido='Esta página es <strong>muy simple</strong>'
    ```
    

- **elemento.textContent**: devuelve todo lo que hay en la etiqueta sin incluir las etiquetas internas (No es muy conveniente usarlo).
    
    ```jsx
    <p>Esta página es <strong>muy simple</strong></p>
    let contenido = elemento.textContent
    // contenido='Esta página es muy simple'
    ```
    
- **elemento.value**: devuelve la propiedad ‘value’ de un <input>.
    
    ```jsx
    //<input name="nombre">
    let cont1 = elem1.value;//cont1 valdría lo que haya escrito en el <input> en ese momento
    
    //<input type="radio" value="H">Hombre
    let cont2 = elem2.value; // cont2="H"
    ```
    
- elemento.style: para dar estilos al elemento
    
    ```jsx
    document.body.style.backgroundColor=`white`
    let myP = document.getElementById(`miP`).style.backgroundColor=`red`
    ```
    

Cambiar propiedades de elementos html desde JavaScript.

```jsx
document.getElementById(`1`).style.backgroundColor = `rgb(172, 111, 172)`
document.getElementById(`resultado`).innerHTML = `ES PAR`
```

## Acceso a nodo usando CSS

**.querySelector(selector):** es igual que getElementById y devuelve el primer elemento del selector CSS indicado.

```jsx
let nodo = document.querySelector(`p.error`);
// la variable nodo contendrá el primer párrafo de clase _error_
let nodo= document.querySelector(`#idDiv`)
// si es un id se hace asi
```

**.querySelectorAll(selector)**: devuelve un NodeList con todos los elementos DOM con mismo selector CSS. Hay bastantes métodos como forEach, item o keys. Se puede acceder a cada elemento como un array o con item.

```jsx
let nodos = document.querySelectorAll(`p.error`);
// la variable nodos contendrá todos los párrafos de clase _error_

```

## Acceso a nodos desde otros

- **elemento.parentElement**: devuelve el elemento padre de elemento.
- **elemento.children**: devuelve la colección con todos los elementos hijo de elemento (sólo elementos HTML, no comentarios ni nodos de tipo texto).

- **elemento.firstElementChild:** devuelve el elemento HTML que es el primer hijo de elemento.
- **elemento.lastElementChild, elemento.lastChild**: igual pero con el último hijo.

- **elemento.nextElementSibling: d**evuelve el elemento HTML que es el siguiente hermano de elemento.
- **elemento.previousElementSibling**: igual pero con el hermano anterior.

- **elemento.childElementCount**: devuelve el nº de nodos hijo de elemento.

## Crear nodo

**document.createElement(`etiqueta`)**: crea un nuevo elemento HTML con la etiqueta indicada, pero aún no se añade a la página.

```jsx
let nuevoLi = document.createElement(`li`)
```

**document.createTextNode('texto')**: crea un nuevo nodo de texto con el texto indicado, que luego
tendremos que añadir a un nodo HTML.

```jsx
let textoLi = document.createTextNode(`Nuevo elemento de lista`)
```

**document.createComment('comentario')**: crea un nuevo comentario de código con el texto indicado, que luego tendremos que añadir a un nodo HTML.

```jsx
let comentario = document.createComment(`Nuevo comentario de código`)
```

## Añadir nodo

**elemento.appendChild(nuevoNodo)**: añade nuevoNodo como último hijo de elemento. Ahora ya se haañadido a la página.

```jsx
// añade el texto creado al elemento LI creado
nuevoLi.appendChild(textoLi);
// selecciona el 1º UL de la página
let miPrimeraLista = document.getElementsByTagName('ul')[0];
// añade LI como último hijo de UL, es decir al final de la lista
miPrimeraLista.appendChild(nuevoLi);
```

**elemento.insertBefore(nuevoNodo, nodo)**: añade nuevoNodo como hijo de elemento antes del hijo nodo.

```jsx
// selecciona el 1º UL de la página
let miPrimeraLista = document.getElementsByTagName('ul')[0];
// selecciona el 1º LI de miPrimeraLista
let primerElementoLista = miPrimeraLista.getElementsByTagName('li')[0];
// añade LI al principio de la lista
miPrimeraLista.insertBefore(nuevoLi, primerElementoLista); 
```

## Función para crear y añadir

```jsx
function crearElemento(tipo, contenido, padre) {// padre= document.body
  let hijo = document.createElement(tipo);
  hijo.innerHTML = contenido;
  padre.appendChild(hijo);
}
```

## Eliminar Nodo

 **elemento.removeChild(nodo)**: borra nodo de elemento y por tanto se elimina de la página.

```jsx
// selecciona el 1º UL de la página
let miPrimeraLista = document.getElementsByTagName('ul')[0];
// selecciona el 1º LI de miPrimeraLista
let primerElementoLista = miPrimeraLista.getElementsByTagName('li')[0];
// borra el primer elemento de la lista
miPrimeraLista.removeChild(primerElementoLista);
// También podríamos haberlo borrado sin tener el padre con:
primerElementoDeLista.parentElement.removeChild(primerElementoDeLista);
```

## Modificar Nodo

- **elemento.before(nuevoNodo)**: Añade el nuevoNodo pasado antes del nodo elemento.
- **elemento.after(nuevoNodo)**: Añade el nuevoNodo pasado después del nodo elemento.
- **elemento.replaceWith(nuevoNodo)**: Reemplaza el nodo elemento con el nuevoNodo pasado.
- **elemento.remove()**: Elimina el nodo elemento.

## Gestión de atributos

Los atributos mas comunes son  id, title o name.

- elemento.attributes: devuelve un array con todos los atributos de elemento.
- elemento.hasAttribute('nombreAtributo'): indica si elemento tiene o no definido el atributo nombreAtributo.
- elemento.getAttribute('nombreAtributo'): devuelve el valor del atributo nombreAtributo de elemento. Para muchos elementos este valor puede directamente con elemento.atributo.
- elemento.setAttribute('nombreAtributo', 'valor'): establece valor como nuevo valor del atributo nombreAtributo de elemento. También puede cambiarseel valor directamente con elemento.atributo=valor.
- elemento.removeAttribute('nombreAtributo'): elimina el atributo nombreAtributo de elemento

```jsx
 // selecciona el 1º UL de la página
let miPrimeraLista = document.getElementsByTagName('ul')[0];
miPrimeraLista.id = 'primera-lista';
// es equivalente ha hacer:
miPrimeraLista.setAttribute('id', 'primera-lista');
```

```jsx
<div id="idEnlace" class="info data dark" data-number="5"></div>
let enlace = document.getElementById(“idEnlace”);
div.hasAttribute('data-number'); // true
div.hasAttributes(); // true (tiene 3)
div.getAttributeNames(); // ['id','data-number','class']
div.getAttribute('id'); // 'page'
div.removeAttribute('id'); // Elimina el atributo id.
div.setAttribute('id', 'idEnlace'); // Vuelve a añadirlo.

if (enlace.hasAttribute(“href”) == false){
	enlace.setAttribute(“href”, “www.google.es”); // Cambiar href
	enlace.className(“visitado”); // Asignar clase “visitado”
}
```

## Atributos de clase

Para añadir atributos:

```jsx
elemento.setAttribute(`className`, `destacado`)
elemento.className=`destacado`
```

ClassList devuelve una coleccion con todas las clases que tiene el elemento:

```jsx
//<p class="destacado direccion">...
let clases=elemento.classList; // clases=['destacado', 'direccion'],
```

Como devuelve una colección y no un array, tenemos los métodos de una colección:

- .add(clase): añade al elemento la clase pasada (si ya la tiene no hace nada).
    
    ```jsx
    elemento.classList.add(`primero`)
    // ahora elemento será <p class="destacado direccion primero">...
    ```
    

- .remove(clase): elimina del elemento la clase pasada (si no la tiene no hace nada).
    
    ```jsx
    elemento.classList.remove(`direccion`)
    // ahora elemento será <p class="destacado primero">...
    ```
    

- .toogle(clase): añade la clase pasada si no la tiene o la elimina si la tiene ya.
    
    ```jsx
    elemento.classList.toogle(`destacado`)
    // ahora elemento será <p class="primero">...
    elemento.classList.toogle(`direccion`)
    // ahora elemento será <p class="primero direccion">...
    ```
    

- .contains(clase): dice si el elemento tiene o no la clase pasada.
    
    ```jsx
    elemento.classList.contains(`direccion`);
     // devuelve true
    ```
    

- .replace(oldClase, newClase): reemplaza del elemento una clase existente por una nueva.
    
    ```jsx
    elemento.classList.replace(`primero`, `ultimo`)
    // ahora elemento será <p class="ultimo direccion">...
    ```