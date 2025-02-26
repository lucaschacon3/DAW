# Principios de POO

## **Abstracción**

La **abstracción** es el proceso de identificar las características esenciales de un objeto, ignorando los detalles innecesarios. Permite representar un concepto de manera simplificada, enfocándose solo en lo que es relevante para el problema en cuestión.

**Ejemplo**: ¿Qué características definen a un autobús?

- **Como pasajero**: precio, público objetivo, número de línea, horarios, etc.
- **Como mecánico**: tipo de motor, ruedas, combustible, etc.

Este proceso permite tratar con información esencial mientras se omiten los detalles complejos.

## **Encapsulación**

La **encapsulación** es el proceso de ocultar los detalles internos de cómo se gestionan los datos dentro de una clase. No se oculta la información en sí, sino la forma en que esta se almacena y se manipula. Esto permite proteger el estado interno del objeto y garantiza que solo pueda modificarse a través de métodos controlados.

**Ejemplo**: ¿Cómo almacenar una fecha?

- **Como un String**: "1/4/2024".
- **Como tres enteros**: día, mes, año.
- **Como un array**: [1, 4, 2024].

El cliente de la clase solo necesita saber cómo interactuar con la fecha, no cómo está implementada internamente.

## **Modularidad**

La **modularidad** es el principio que promueve la descomposición de un sistema en partes o módulos independientes, lo que facilita el mantenimiento y mejora la comprensión del sistema. Para lograr una buena modularidad, las partes deben tener **bajo acoplamiento** (pocas dependencias entre sí) y **alta cohesión** (cada módulo tiene una responsabilidad clara y bien definida).

**Ejemplo**: Un sistema de gestión de clientes y pedidos puede dividirse en módulos como "Gestión de clientes", "Gestión de pedidos" y "Generación de informes".

## **Jerarquía**

La **jerarquía** se refiere a la organización de elementos en niveles o grados de responsabilidad. En POO, se utiliza principalmente para representar relaciones de herencia (especialización/generalización), donde las clases derivadas heredan características de las clases base.

Existen dos tipos principales de jerarquía:

- **Jerarquía de clasificación (herencia)**: Ejemplo: `Animal -> Vertebrado -> Mamífero`.
- **Jerarquía de composición**: Ejemplo: `Factura -> Datos del cliente (nombre, DNI) + Total + Detalles`.

---

# Conceptos de POO

## **Objeto (Encapsulamiento)**

Un **objeto** es una instancia de una clase que representa una entidad del mundo real con un estado y comportamiento definidos por sus atributos y métodos. Los objetos interactúan entre sí enviándose mensajes.

**Ejemplo en el mundo real**: El coche rojo que está aparcado allá abajo (un coche concreto con atributos y comportamientos específicos).

**En un ordenador**: Un objeto ocupa espacio en memoria (RAM) y tiene un ciclo de vida, desde su creación (cuando se reserva memoria) hasta su destrucción (cuando se libera la memoria).

## **Clase (Abstracción, Modularidad)**

Una **clase** es una plantilla o molde para crear objetos. Define los atributos y comportamientos comunes que compartirán todos los objetos de esa clase.

**Ejemplo en el mundo real**: La clase "Coche" es una abstracción que agrupa características comunes (como color, marca, modelo) y comportamientos (acelerar, frenar).

**En un ordenador**: Una clase es una entidad estática que reside en la memoria, define la estructura de los objetos y proporciona una interfaz para interactuar con ellos a través de métodos.

## **Herencia**

La **herencia** es un mecanismo que permite que una clase derive de otra, adoptando sus atributos y métodos. Establece una relación de especialización/generalización entre clases.

**Ejemplo**: Una clase `Mamífero` puede ser la base de una clase `Perro`, que hereda las propiedades comunes y puede añadir comportamientos adicionales.

**Tipos de herencia**:

- **Herencia simple**: Una clase tiene un único padre.
- **Herencia múltiple**: Una clase hereda de varias clases. (En algunos lenguajes como Python se permite la herencia múltiple).
- **Pseudomúltiple (interfaces)**: Una clase puede implementar varias interfaces, pero solo heredar de una clase.

## **Polimorfismo**

El **polimorfismo** es la capacidad de un objeto de responder a un mismo mensaje de formas diferentes, dependiendo de la clase que lo reciba. Esto permite que se puedan utilizar métodos con el mismo nombre, pero con comportamientos específicos según el tipo de objeto que los invoque.

### **Tipos de Polimorfismo**

1. **Polimorfismo de sobrecarga**: Un método puede tener varias versiones con el mismo nombre, pero con diferentes números o tipos de parámetros. La selección de la versión correcta se realiza en tiempo de compilación.
2. **Polimorfismo de subtipado**: Un objeto de una subclase puede ser tratado como un objeto de su superclase. Esto es posible gracias a la herencia.
3. **Polimorfismo paramétrico o genérico**: Permite escribir funciones o clases que operan sobre cualquier tipo de dato, independientemente de su tipo concreto. El tipo real se determina en tiempo de ejecución.

### **Enlazado**

- **Enlazado estático**: Se resuelve en tiempo de compilación. Los métodos estáticos y variables estáticas utilizan enlazado estático, lo que hace que sean más rápidos y eficientes.
- **Enlazado dinámico**: La resolución del método se hace en tiempo de ejecución, lo que permite que los métodos puedan tener comportamientos diferentes según el objeto al que se les invoque.