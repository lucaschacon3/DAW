## Problemas en el Código

Los códigos de mala calidad presentan los siguientes problemas:

- **Costosos y lentos de desarrollar**: Tiempos largos de programación, lo que incrementa los costos.
- **Difíciles de gestionar y mantener**: No son fáciles de modificar, actualizar o adaptarse a nuevas necesidades.
- **No cumplen los requisitos ni las expectativas del cliente**: El código no satisface las necesidades del cliente, lo que puede llevar a un software ineficaz.
- **Errores difíciles de corregir**: La falta de claridad y estructura hace que los errores sean complicados de identificar y resolver.
- **Código espagueti**: Un código desordenado, complejo e incomprensible que dificulta la modificación y la colaboración.

## Características de un Software de Calidad

Un software de calidad debe cumplir con ciertas características clave:

- **Eficiencia**: Optimizado para usar de manera mínima los recursos del sistema, como CPU, RAM y almacenamiento.
- **Fiabilidad**: No debe presentar errores durante su ejecución.
- **Escalabilidad**: Capacidad de crecer y manejar un aumento en el número de usuarios o datos sin degradarse en rendimiento.
- **Usabilidad**: Debe ser fácil de usar, cumpliendo con las expectativas del cliente final.
- **Portabilidad**: Capaz de ejecutarse en diferentes sistemas operativos o plataformas sin necesidad de cambios significativos.
- **Seguridad**:
    - **Disponibilidad**: El sistema debe estar disponible y accesible cuando se necesite.
    - **Autenticidad**: Garantizar que los usuarios sean quienes dicen ser.
    - **No repudio**: Los registros de las acciones realizadas no pueden ser negados, asegurando transparencia.
    - **Integridad**: La información no debe ser alterada sin autorización.
    - **Confidencialidad**: La protección de la información para que solo personas autorizadas puedan acceder a ella.

## Un Código Limpio

Un **código limpio** tiene las siguientes características:

- **Legibilidad**: Es fácil de leer y entender, lo que facilita el trabajo en equipo y la colaboración.
- **Mantenibilidad y modificabilidad**: Es sencillo realizar cambios y mejoras en el código sin introducir errores.
- **Sin errores**: El código debe estar libre de bugs y fallos lógicos.
- **Productividad**: Aunque el desarrollo inicial puede ser más costoso en tiempo, un código limpio facilita modificaciones y mantenimiento a largo plazo.
- **Bien tabulado**: El código debe tener una estructura clara, con la indentación adecuada para facilitar su lectura.

## Programación Estructurada

En la **programación estructurada**, se deben evitar ciertos elementos que complican la comprensión y el flujo del programa, como el uso de `break` o `continue` en los bucles. El código debe organizarse en **algoritmos estructurados**, como:

- **Secuenciales**: Pasos que se ejecutan de forma lineal.
- **Condicionales**: Decisiones que modifican el flujo del programa (como `if` o `switch`).
- **Bucles**: Repeticiones de bloques de código (como `for`, `while`).

## Programación Orientada a Objetos (POO)

La **POO** se basa en los siguientes principios fundamentales:

- **Encapsulación**: Los métodos y atributos son privados y se exponen solo cuando es necesario, protegiendo el estado interno del objeto.
- **Modularidad**: El programa se divide en módulos o clases, lo que facilita la reutilización y el mantenimiento.
- **Abstracción**: Facilita la comprensión del sistema al ocultar los detalles complejos y exponer solo lo necesario.
- **Herencia y Polimorfismo**: Permiten la reutilización de código y la extensión de funcionalidades, así como la capacidad de un objeto de responder de diferentes maneras a la misma acción.

## Niveles de Abstracción del Lenguaje

- **Lenguaje humano**: Naturalmente ambiguo y no estructurado.
- **Lenguaje de alto nivel**: Lenguajes como **Java**, **Python**, **Fortran** (primer lenguaje POO), que son más cercanos a la comprensión humana.
- **Lenguaje de medio nivel**: Lenguajes como **C** o **C++**, que ofrecen un control más directo sobre el hardware.
- **Lenguaje de bajo nivel**: **Ensamblador**, código máquina y binario/objeto, que están directamente relacionados con el hardware.
- **Hardware**: Nivel más bajo, el lenguaje que entiende el procesador.

## Nombres Significativos

Usar **nombres significativos** para variables, funciones, clases y métodos facilita la comprensión del código. Algunos puntos clave:

- **Mejora la legibilidad**: Facilita que el código sea entendido por cualquier desarrollador.
- **Hace el código más cercano al lenguaje natural**: Los nombres descriptivos ayudan a comprender lo que hacen sin necesidad de leer todo el código.
- **Facilita el mantenimiento**: Un código con nombres claros es más fácil de modificar.
- **Evita confusión**: Se deben evitar nombres similares que puedan generar confusión entre variables o funciones.
- **Nombres fáciles de pronunciar y buscar**: Utilizar nombres sencillos para facilitar su búsqueda en el IDE.

Ejemplos de nombres adecuados:

- **Constantes**: `PI`.
- **Variables**: `num`, `cad`.
- **Variables booleanas**: `esVariable`, `es_valido`.
- **Funciones estáticas**: `comprobarPar()`, `comprobar_par()`.
- **Métodos**: `getSueldo()`.
- **Clases**: `Persona`, `Cuenta`.

## Funciones

Las funciones deben:

- **Hacer una sola cosa**: El principio de "una función, una responsabilidad" hace el código más claro y fácil de modificar.
- **Ser cortas**: Lo ideal es que no superen las 15-20 líneas por página.
- **Recibir un máximo de tres argumentos**: Evitar funciones con demasiados parámetros, en su lugar se pueden usar objetos o estructuras para organizar los datos.

## Comentarios

- **Evitar comentarios innecesarios**: El código debe ser autoexplicativo y parecerse lo máximo posible al lenguaje natural.
- **Usar solo cuando sea necesario**: Úsalos solo para explicar partes complejas del código, como expresiones regulares o algoritmos difíciles de entender a simple vista.
- **Eliminar comentarios al refactorizar**: Después de mejorar el código, los comentarios que explicaban cosas evidentes deben ser eliminados.

## Optimización

Optimizar el código significa reducir su consumo de recursos como **CPU**, **RAM** y **almacenamiento** a través de algoritmos más eficientes.

## Refactorización

La **refactorización** es el proceso de mejorar el código sin cambiar su funcionalidad. El objetivo es hacer el código más legible, mantenible y fácil de modificar. Algunas técnicas de refactorización incluyen:

- **Renombrar**: Usar nombres significativos que describan claramente el propósito de las variables, funciones, clases, etc.
- **Reestructurar el código**: Simplificar bloques complejos, eliminar código innecesario y reducir las anidaciones.
- **Extraer / Dividir funciones**: Dividir funciones grandes en otras más pequeñas que hagan una sola cosa.
- **Eliminar duplicados**: El código duplicado debe eliminarse y centralizarse en una sola función o clase.
- **Patrón de diseño**: Aplicar soluciones estándar a problemas comunes para hacer el código más reutilizable y eficiente.
- **Smell Codes**: Detectar y aplicar técnicas para refactorizar partes del código que "huelen mal", es decir, que son complicadas o ineficientes.