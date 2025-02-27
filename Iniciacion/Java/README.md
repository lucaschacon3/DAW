# Java:

- **Orientado a objetos**: Java sigue el paradigma de la programación orientada a objetos (OOP), lo que significa que todo en Java es un objeto, y las interacciones se realizan a través de métodos y propiedades de estos objetos.
- **Lenguaje de alto nivel**: Java es un lenguaje de programación de alto nivel, lo que facilita la escritura y comprensión del código al abstraer detalles complejos de la máquina.
- **Funciona bajo una máquina virtual (JVM)**: El código fuente de Java se compila a bytecode, que es interpretado por la Máquina Virtual de Java (JVM). Esto hace que Java sea **multiplataforma**, es decir, "Write Once, Run Everywhere" (escribir una vez, ejecutar en cualquier lugar), ya que cualquier dispositivo con una JVM puede ejecutar el bytecode sin necesidad de recompilar.

---

## Variables en Java

Las **variables** son fundamentales en cualquier lenguaje de programación. En Java, las variables son contenedores que almacenan datos de tipos específicos.

### Tipos de Variables

1. **Tipos primitivos**:
    - **`int`**: Números enteros (Ej. `10`, `5`, `500`).
    - **`double`**: Números con decimales (Ej. `3.14`, `0.001`).
    - **`float`**: Similar a `double`, pero con menor precisión.
    - **`boolean`**: Valor lógico, puede ser `true` o `false`.
    - **`char`**: Un solo carácter (Ej. `'A'`, `'1'`, `'@'`).
    - **`long`**: Enteros grandes (Ej. `1000000000`).
    - **`byte`** y **`short`**: Tipos de enteros con menor capacidad de almacenamiento.
2. **Tipos no primitivos**:
    - **`String`**: Para representar cadenas de texto (Ej. `"Hola Mundo"`).
    - **Objetos**: Instancias de clases definidas por el programador.

### Declaración e Inicialización

```java
int edad = 25;          // Variable de tipo entero
double altura = 1.75;   // Variable de tipo double
boolean esActivo = true; // Variable booleana
String nombre = "Ana";  // Variable de tipo String

```

### Variables Locales, de Instancia y Estáticas

- **Locales**: Declaradas dentro de métodos. Solo existen dentro del método.
- **De Instancia**: Pertenecen a objetos de la clase. Se definen fuera de los métodos pero dentro de la clase.
- **Estáticas**: Definidas con `static`, pertenecen a la clase y no a instancias específicas.

### Constantes

En Java, puedes definir **constantes** usando la palabra clave `final`:

```java
final double PI = 3.14159;

```

---

## Estructuras de Control: Bucles y Condicionales

Las **estructuras de control** permiten modificar el flujo de ejecución del programa. Estas estructuras incluyen **condicionales** y **bucles**.

### Condicionales:

1. **`if`**: Permite ejecutar un bloque de código si se cumple una condición.

```java
if (edad >= 18) {
    System.out.println("Eres mayor de edad");
}

```

1. **`else`**: Ejecuta otro bloque de código si la condición del `if` es falsa.

```java
if (edad >= 18) {
    System.out.println("Eres mayor de edad");
} else {
    System.out.println("Eres menor de edad");
}

```

1. **`else if`**: Permite evaluar varias condiciones.

```java
if (edad >= 18) {
    System.out.println("Eres adulto");
} else if (edad >= 13) {
    System.out.println("Eres adolescente");
} else {
    System.out.println("Eres un niño");
}

```

1. **`switch`**: Compara el valor de una variable con varias opciones posibles.

```java
int dia = 2;
switch (dia) {
    case 1:
        System.out.println("Lunes");
        break;
    case 2:
        System.out.println("Martes");
        break;
    case 3:
        System.out.println("Miércoles");
        break;
    default:
        System.out.println("Día inválido");
}

```

### Bucles:

1. **`for`**: Se utiliza cuando se conoce cuántas veces se debe ejecutar un bloque de código.

```java
for (int i = 0; i < 5; i++) {
    System.out.println(i);  // Imprime los números del 0 al 4
}

```

1. **`while`**: Repite un bloque de código mientras se cumpla una condición.

```java
int i = 0;
while (i < 5) {
    System.out.println(i);
    i++;
}

```

1. **`do-while`**: Ejecuta el bloque de código al menos una vez antes de verificar la condición.

```java
int i = 0;
do {
    System.out.println(i);
    i++;
} while (i < 5);

```

---

## Funciones en Java

Las **funciones** (o métodos) permiten organizar el código y realizar tareas específicas que se pueden reutilizar.

### Definición de un Método:

```java
public tipoDeRetorno nombreMetodo(tipoParametro1 parametro1, tipoParametro2 parametro2) {
    // Cuerpo del método
}

```

- **Métodos que retornan un valor**:

```java
public int sumar(int a, int b) {
    return a + b;
}

```

- **Métodos `void`**: No retornan ningún valor.

```java
public void imprimirSaludo() {
    System.out.println("¡Hola Mundo!");
}

```

### Llamar a un Método:

```java
int resultado = sumar(5, 3); // Llama al método y obtiene el resultado
imprimirSaludo();  // Llama al método sin retorno

```

### Sobrecarga de Métodos: Permite crear métodos con el mismo nombre pero diferentes parámetros.

```java
public int sumar(int a, int b) {
    return a + b;
}

public double sumar(double a, double b) {
    return a + b;
}

```

---

## Cadenas (Strings) en Java

Las **cadenas de texto** se representan con el tipo `String`. Java maneja las cadenas de manera especial debido a su inmutabilidad (una vez creada, no se puede modificar).

### Creación y Operaciones con Cadenas:

1. **Crear una cadena**:

```java
String saludo = "Hola, Mundo!";

```

1. **Concatenación de cadenas**:

```java
String nombre = "Lucas";
String saludo = "Hola, " + nombre + "!";
System.out.println(saludo);  // Imprime: Hola, Lucas!

```

1. **Métodos comunes**:
    - **`length()`**: Devuelve la longitud de la cadena.
        
        ```java
        System.out.println(saludo.length());  // Imprime el número de caracteres
        
        ```
        
    - **`toUpperCase()`**: Convierte la cadena a mayúsculas.
        
        ```java
        System.out.println(saludo.toUpperCase());  // Imprime: HOLA, MUNDO!
        
        ```
        
    - **`toLowerCase()`**: Convierte la cadena a minúsculas.
    - **`substring()`**: Extrae una subcadena.
        
        ```java
        System.out.println(saludo.substring(0, 4));  // Imprime: Hola
        
        ```
        
    - **`equals()`**: Compara dos cadenas.
        
        ```java
        String str1 = "Hola";
        String str2 = "Hola";
        System.out.println(str1.equals(str2));  // Imprime: true
        
        ```
        

---

## POO en Java

La **Programación Orientada a Objetos (POO)** es un paradigma que organiza el software en objetos. Estos objetos tienen **atributos** (propiedades) y **métodos** (funciones). Los principales conceptos de la POO en Java son **Clases, Métodos, Herencia, Polimorfismo** y **Encapsulamiento**.

### Clases y Objetos

1. **Definir una clase**:
Una clase es una plantilla para crear objetos. Define los atributos y métodos de los objetos que serán instanciados.
    
    ```java
    public class Persona {
        String nombre;
        int edad;
    
        // Método constructor
        public Persona(String nombre, int edad) {
            this.nombre = nombre;
            this.edad = edad;
        }
    
        // Método para mostrar los datos
        public void mostrar() {
            System.out.println("Nombre: " + nombre + ", Edad: " + edad);
        }
    }
    
    ```
    
2. **Crear un objeto (instancia de la clase)**:
    
    ```java
    Persona persona1 = new Persona("Juan", 30);
    persona1.mostrar();  // Imprime: Nombre: Juan, Edad: 30
    
    ```
    

### Herencia

La **herencia** permite crear una nueva clase que hereda atributos y métodos de una clase existente.

```java
class Animal {
    String nombre;

    public void dormir() {
        System.out.println("El animal está durmiendo.");
    }
}

class Perro extends Animal {
    public void ladrar() {
        System.out.println("¡Guau!");
    }
}

public class TestHerencia {
    public static void main(String[] args) {
        Perro perro1 = new Perro();
        perro1.nombre = "Rex";
        perro1.ladrar();  // Imprime: ¡Guau!
        perro1.dormir();  // Imprime: El animal está durmiendo.
    }
}

```

### Polimorfismo

El **polimorfismo** permite que una clase tenga varios métodos con el mismo nombre pero comportamientos diferentes dependiendo de la clase del objeto.

```java
class Animal {
    public void hacerSonido() {
        System.out.println("El animal hace un sonido");
    }
}

class Perro extends Animal {
    @Override
    public void hacerSonido() {
        System.out.println("El perro ladra");
    }
}

public class TestPolimorfismo {
    public static void main(String[] args) {
        Animal miAnimal = new Animal();
        Animal miPerro = new Perro();

        miAnimal.hacerSonido();  // Imprime: El animal hace un sonido
        miPerro.hacerSonido();   // Imprime: El perro ladra
    }
}

```

---

## Forma de compilar en Java

1. **prog.java** -> compila -> **prog.class** (Bytecode)
2. **prog.class** -> Enlaza (link) -> Librerías (Bytecode)
3. El resultado final es el archivo **prog.jar** (ejecutable en Java).
- **La JVM** se encarga de interpretar el **bytecode** generado.

---

## Estructura de Java

1. **JDK (Java Development Kit)**:
    - Conjunto de herramientas que incluye compiladores, depuradores y otros programas necesarios para el desarrollo de aplicaciones Java.
2. **JRE (Java Runtime Environment)**:
    - Es un entorno que incluye la JVM y las librerías necesarias para ejecutar aplicaciones Java, pero no las herramientas de desarrollo.
3. **JVM (Java Virtual Machine)**:
    - Es la máquina virtual que interpreta el bytecode y lo ejecuta en el sistema operativo correspondiente, haciendo que Java sea multiplataforma.

---

## Comandos de Java

- **Crear un archivo `.java`**: `touch prog.java`
- **Mostrar el código fuente**: `more prog.java`
- **Compilar el archivo `.java`**: `javac prog.java` (Genera el archivo `.class`)
- **Ejecutar el archivo `.class`**: `java prog` (Ejecuta el bytecode en la JVM)
- **Ejecutar un archivo `.jar`**: `java -jar prog.jar` (Ejecuta un archivo ejecutable en formato JAR)
- **Descompilar un archivo `.class`**: `javap prog.class` (Muestra la estructura interna del bytecode)
- **Generar documentación**: `javadoc prog.java` (Genera la documentación API del código fuente)
- **Depurar el código**: `jdb prog` (Inicia el depurador de Java)
- **Consola interactiva de Java**: `jshell` (Entorno interactivo para probar fragmentos de código Java)
- **Ver dependencias de clases**: `jdeps prog.class` (Muestra las dependencias de clases del archivo `.class`)

---

## Javadoc

- **¿Qué es?**
    - Javadoc es una herramienta que se utiliza para generar documentación API del código fuente de un programa Java.
- **Sintaxis de comentarios Javadoc**:
    - Se escriben dentro de `/**` y `/`.
- **Elementos comunes en Javadoc**:
    - `@author`: Indica el autor de la clase.
    - `@version`: Indica la versión de la clase.
    - `@return`: Especifica el valor que devuelve un método (no se utiliza con métodos `void`).
    - `@param`: Especifica los parámetros que recibe un método.
    - `@deprecated`: Marca un método o clase como obsoleto.
- **Ejemplo de Javadoc**:
    
    ```java
    /**
     * Esta es una clase de ejemplo.
     * @author Lucas
     * @version 1.2
     * @return int
     * @param f1, f2
     * @deprecated
     */
    public class Ejemplo {
        // código de la clase
    }
    
    ```