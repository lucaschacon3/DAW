# Tailwind

### **1. Colores**

### **Colores de fondo (background colors):**

```html
bg-red-500    <!-- Fondo rojo -->
bg-blue-200   <!-- Fondo azul claro -->
bg-gray-100   <!-- Fondo gris claro -->
bg-green-600  <!-- Fondo verde oscuro -->
```

### **Colores de texto (text colors):**

```html
text-white    <!-- Texto blanco -->
text-black    <!-- Texto negro -->
text-gray-700 <!-- Texto gris oscuro -->
text-red-500  <!-- Texto rojo -->
```

### **Colores de borde (border colors):**

```html
border-red-500    <!-- Borde rojo -->
border-gray-300   <!-- Borde gris claro -->
border-blue-700   <!-- Borde azul -->
```

### **Colores de sombra (box-shadow):**

```html
shadow-md    <!-- Sombra media -->
shadow-lg    <!-- Sombra grande -->
shadow-xl    <!-- Sombra extra grande -->
```

---

### **2. Hover**

```html
hover:bg-blue-600  <!-- Fondo azul al pasar el ratón -->
hover:text-white   <!-- Texto blanco al pasar el ratón -->
hover:scale-105    <!-- Aumentar tamaño al pasar el ratón -->
hover:underline   <!-- Subrayado al pasar el ratón -->
```

Ejemplo:

```html
<button class="bg-blue-500 hover:bg-blue-600 text-white py-2 px-4 rounded">
  Hover me
</button>
```

---

### **3. Posicionaminto**

### Posicionamiento de texto

```html
text-left     <!-- Alinear texto a la izquierda -->
text-center   <!-- Alinear texto al centro -->
text-right    <!-- Alinear texto a la derecha -->
text-justify  <!-- Justificar texto -->
```

### **Posicionamiento Relativo y Absoluto:**

```html
relative      <!-- Posicionamiento relativo -->
absolute      <!-- Posicionamiento absoluto -->
top-0         <!-- Fijar al tope -->
left-0        <!-- Fijar a la izquierda -->
bottom-0      <!-- Fijar al fondo -->
right-0       <!-- Fijar a la derecha -->
```

### **Posicionamiento Fijo:**

```html
fixed         <!-- Posicionamiento fijo -->
top-0         <!-- Fijar en la parte superior -->
left-0        <!-- Fijar en la parte izquierda -->
bottom-0      <!-- Fijar en la parte inferior -->
right-0       <!-- Fijar en la parte derecha -->
```

### **Posicionamiento en Flexbox:**

```html
flex          <!-- Contenedor flex -->
flex-row      <!-- Dirección horizontal (por defecto) -->
flex-col      <!-- Dirección vertical -->
justify-start <!-- Alineación horizontal al principio -->
justify-center<!-- Alineación horizontal al centro -->
justify-end   <!-- Alineación horizontal al final -->
justify-between <!-- Distribución del espacio entre los elementos -->
justify-around  <!-- Distribución del espacio alrededor de los elementos -->
items-start   <!-- Alineación vertical al principio -->
items-center  <!-- Alineación vertical al centro -->
items-end     <!-- Alineación vertical al final -->
space-x-4     <!-- Espacio horizontal entre los elementos -->
space-y-4     <!-- Espacio vertical entre los elementos -->
```

```html
<!-- Contenedor Flex -->
<div class="flex flex-col items-center justify-center min-h-screen bg-gray-100">
  <div class="w-32 h-32 bg-red-500 mb-4">Elemento 1</div>
  <div class="w-32 h-32 bg-blue-500">Elemento 2</div>
</div>
```

```html
<!-- Flex con Espaciado Horizontal -->
<div class="flex space-x-4 bg-gray-200 p-4">
  <div class="w-16 h-16 bg-red-500"></div>
  <div class="w-16 h-16 bg-blue-500"></div>
  <div class="w-16 h-16 bg-green-500"></div>
</div>
```

### **Posicionamiento con Grid:**

```html
grid            <!-- Contenedor grid -->
grid-cols-1     <!-- 1 columna -->
grid-cols-2     <!-- 2 columnas -->
grid-cols-3     <!-- 3 columnas -->
grid-rows-1      <!-- 1 fila -->
grid-rows-2      <!-- 2 filas -->
col-span-1       <!-- Columna de 1 unidad -->
col-span-2       <!-- Columna de 2 unidades -->
row-span-1       <!-- Fila de 1 unidad -->
row-span-2       <!-- Fila de 2 unidades -->
gap-4            <!-- Espacio entre las celdas de la grilla -->
```

```html
<!-- Grid con 2 Columnas -->
<div class="grid grid-cols-2 gap-4 p-4">
  <div class="bg-red-500 h-32">Columna 1</div>
  <div class="bg-blue-500 h-32">Columna 2</div>
</div>
```

```html
<!-- Grid con 3 Columnas -->
<div class="grid grid-cols-3 gap-4 p-4">
  <div class="bg-red-500 h-32">Columna 1</div>
  <div class="bg-blue-500 h-32">Columna 2</div>
  <div class="bg-green-500 h-32">Columna 3</div>
</div>
```

```html
<!-- Grid con Col Span -->
<div class="grid grid-cols-3 gap-4 p-4">
  <div class="bg-red-500 h-32 col-span-2">Columna que ocupa 2 columnas</div>
  <div class="bg-blue-500 h-32">Columna 2</div>
</div>
```

### **Posicionamiento con Float:**

```html
float-left      <!-- Flotar a la izquierda -->
float-right     <!-- Flotar a la derecha -->
```

### **Margen (Margin):**

```html
m-0            <!-- Sin margen -->
m-1            <!-- Margen pequeño -->
m-2            <!-- Margen mediano -->
m-4            <!-- Margen grande -->
m-8            <!-- Margen más grande -->
mt-4           <!-- Margen arriba -->
mr-4           <!-- Margen a la derecha -->
mb-4           <!-- Margen abajo -->
ml-4           <!-- Margen a la izquierda -->
mx-4           <!-- Margen horizontal (izquierda y derecha) -->
my-4           <!-- Margen vertical (arriba y abajo) -->
```

---

### **4. Bordes**

### **Bordes:**

```html
border        <!-- Añadir borde -->
border-2      <!-- Borde de 2px -->
border-4      <!-- Borde de 4px -->
border-t      <!-- Solo borde superior -->
border-b      <!-- Solo borde inferior -->
border-l      <!-- Solo borde izquierdo -->
border-r      <!-- Solo borde derecho -->
```

### **Radio de borde (border radius):**

```html
rounded        <!-- Bordes redondeados -->
rounded-sm     <!-- Bordes redondeados pequeños -->
rounded-lg     <!-- Bordes redondeados grandes -->
rounded-full   <!-- Bordes completamente redondeados -->
```

### **Bordes con colores:**

```html
border-red-500   <!-- Borde rojo -->
border-blue-200  <!-- Borde azul claro -->
```

---

### **5. Tamaños**

### **Ancho y alto:**

```html
w-1/2      <!-- Ancho del 50% -->
w-1/3      <!-- Ancho del 33.33% -->
w-full     <!-- Ancho completo -->
h-16       <!-- Alto de 4rem -->
h-32       <!-- Alto de 8rem -->
h-screen   <!-- Alto de pantalla completa -->
```

### **Espaciado (Padding y Margin):**

```html
p-4        <!-- Padding de 1rem -->
m-4        <!-- Margin de 1rem -->
mt-4       <!-- Margin superior de 1rem -->
mb-8       <!-- Margin inferior de 2rem -->
px-4       <!-- Padding horizontal (izquierda y derecha) -->
py-2       <!-- Padding vertical (arriba y abajo) -->
```

---

### **6. Responsive**

### **Breakpoints (puntos de ruptura):**

Tailwind utiliza el sistema `sm`, `md`, `lg`, y `xl` para los puntos de ruptura de los dispositivos.

```html
sm:w-full   <!-- En pantallas pequeñas (sm) usar 100% de ancho -->
md:w-1/2    <!-- En pantallas medianas (md) usar 50% de ancho -->
lg:w-1/3    <!-- En pantallas grandes (lg) usar 33.33% de ancho -->
xl:w-1/4    <!-- En pantallas extra grandes (xl) usar 25% de ancho -->
```

```html
<div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3">
  <!-- Contenido aquí -->
</div>

```