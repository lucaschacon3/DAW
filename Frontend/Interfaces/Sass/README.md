# Sass

**Sass** (Syntactically Awesome Stylesheets) es un preprocesador que amplía las capacidades de CSS y permite escribir código más limpio, modular y dinámico. Veremos conceptos como **mixins, funciones y bucles**. Además, aprenderás a compilar tu código Sass en CSS utilizando **VSCode** o la consola con **npm**.

---

## **Instalación y configuración de Sass**

### **Instalación con npm**

- Asegúrate de tener Node.js instalado.
- Instala Sass globalmente con:
    
    ```bash
    npm install -g sass
    
    ```
    
- Verifica la instalación:
    
    ```bash
    sass --version
    
    ```
    
- Compila un archivo manualmente:
    
    ```bash
    sass archivo.scss archivo.css
    
    ```
    

---

### **Intalación en VSCode**

- Instala la extensión [Live Sass Compiler](https://marketplace.visualstudio.com/items?itemName=ritwickdey.live-sass).
- Crea un archivo `.scss`, dale a Watch Sass en la parte inferior y al guardar, se compilará automáticamente en un archivo `.css`.
- Ese archivo `.css` es el que hay que emparejar con el html.

---

## **Variables, Listas y Mapas**

### **Variables**

```scss
$color-primario: #3498db;
$espaciado: 16px;

body {
  background-color: $color-primario;
  margin: $espaciado;
}

```

### **Listas**

```scss
//Definicion
$colores: red, green, blue, yellow; // Valoresseparados con comas
$colores: red green blue yellow; // Valores separados sin comas
$colores: 'red' 'green' 'blue' 'yellow'; // Valores con comillas

//Acceso
$primer-color: nth($colores, 1); // red
$segundo-color: nth($col
```

### **Mapas (clave-valor)**

```scss
//Definición
$botones: (
primary: #3498db,
secondary: #e74c3c,
success: #2ecc71
);

//Acceso
$color-primary: map-get($botones, primary); // #3498db
$color-secondary: map-get($botones, secondary); // #e74c3c
```

---

## **Anidación**

```scss
nav {
  background-color: #333;
  padding: 1em;
	button {
		background-color: blue;
		&:hover {
		background-color: red;
		}
	}  
}
```

## **Directiva `@extend`**

Usa `@extend` para reutilizar estilos heredándolos de una clase base.

```scss
// Clase base
.btn {
  background-color: #3498db;
  color: white;
  padding: 10px 20px;
}

// Herencia de la clase base
.btn-primary {
  @extend .btn;
  background-color: #1abc9c;
}

```

---

## **Directiva `@import`**

Organiza tus estilos dividiendo el código en múltiples archivos y luego importándolos.

### **Estructura de Archivos**

```
styles/
|-- _variables.scss
|-- _mixins.scss
|-- _header.scss
|-- main.scss

```

**Ejemplo:**

```scss
// main.scss
@import 'variables';
@import 'mixins';
@import 'header';

```

---

## **Directiva `@use`**

Para importar otros scss en el archivo principal.

### **Estructura de Archivos**

```
styles/
|-- _header.scss
|-- _footer.scss
|-- main.scss

```

**Ejemplo:**

```scss
// main.scss
@use 'header';
@use 'footer';
```

---

## **Estructuras de Control**

### **Condicional `@if-@else`**

```scss
$modo: dark;

body {
  @if $modo == light {
    background-color: white;
    color: black;
  } @else {
    background-color: black;
    color: white;
  }
}

```

### **Bucle `@for`**

```scss
@for $i from 1 through 5 {
  .margin-#{$i} {
    margin: #{$i * 10}px;
  }
}

```

### **Bucle `@while`**

```scss
$i: 1;

@while $i <= 3 {
  .padding-#{$i} {
    padding: #{$i * 5}px;
  }
  $i: $i + 1;
}

```

### **Bucle `@each`**

```scss
$colores: red, blue, green;

@each $color in $colores {
  .bg-#{$color} {
    background-color: $color;
  }
}

```

---

## **Funciones**

Crea funciones personalizadas para calcular valores dinámicos.

```scss
@function calcular-rem($px) {
  @return $px / 16 * 1rem;
}

h1 {
  font-size: calcular-rem(32); // Resultado: 2rem
}

```

---

## **Mixins**

Son para reutilizar bloques de código parametrizados o no.

### **Mixin sin parámetros**

```scss
@mixin centrar {
  display: flex;
  justify-content: center;
  align-items: center;
}

.container {
  @include centrar;
}

```

### **Mixin con parámetros**

```scss
@mixin fuente($size, $color) {
  font-size: $size;
  color: $color;
}

p {
  @include fuente(16px, #333);
}

```

### **Mixin con parámetros por defecto**

```scss
@mixin borde($color: black, $grosor: 1px) {
  border: $grosor solid $color;
}

.box {
  @include borde; // Usa valores por defecto
  @include borde(red, 2px); // Sobrescribe los valores
}

```

---

## **Proyecto Práctico**

### **Estructura del Proyecto**

```
styles/
|-- _variables.scss
|-- _mixins.scss
|-- _header.scss
|-- _footer.scss
|-- _main.scss
main.scss
index.html

```

### **Contenido del Proyecto**

1. **_variables.scss**:
Define colores y tipografías globales.
    
    ```scss
    $color-primario: #3498db;
    $color-secundario: #2ecc71;
    
    ```
    
2. **_mixins.scss**:
Define mixins reutilizables.
    
    ```scss
    @mixin centrar {
      display: flex;
      justify-content: center;
      align-items: center;
    }
    
    ```
    
3. **_header.scss**:
Define los estilos del header.
    
    ```scss
    header {
      @include centrar;
      background-color: $color-primario;
      height: 100px;
    
      h1 {
        color: white;
      }
    }
    
    ```
    
4. **main.scss**:
Importa los demás archivos.
    
    ```scss
    @import 'variables';
    @import 'mixins';
    @import 'header';
    @import 'footer';
    
    ```
    
5. **index.html**:
Incluye el CSS compilado.
    
    ```html
    <!DOCTYPE html>
    <html lang="en">
    <head>
      <link rel="stylesheet" href="main.css">
    </head>
    <body>
      <header>
        <h1>Mi Proyecto Sass</h1>
      </header>
    </body>
    </html>
    
    ```