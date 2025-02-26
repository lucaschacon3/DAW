## Ciclo de Vida del Software

El ciclo de vida del software se compone de varias fases que guían el desarrollo de una aplicación desde su concepción hasta su mantenimiento. Las principales fases son:

1. **Análisis**
2. **Diseño**
3. **Codificación**
4. **Pruebas**
5. **Documentación**
6. **Explotación**
7. **Mantenimiento**

### 1. Análisis (¿Qué hace mi programa?)

En esta fase se definen las funcionalidades y características del software:

- **Requisitos funcionales**: Lo que el sistema debe hacer. Ejemplos incluyen:
    - Permitir iniciar sesión.
    - Permitir la búsqueda de categorías.
    - Calcular el precio total de un carrito de compras.
- **Requisitos no funcionales**: Características de calidad que el sistema debe cumplir, como:
    - Interfaz intuitiva.
    - Compatibilidad con diferentes navegadores.
    - Requisitos de seguridad.
- **Requisitos de información**: Especificación de cómo se gestionará la información, como:
    - Ficheros locales.
    - Bases de datos (BBDD).

### 2. Diseño (¿Cómo hago mi programa?)

En esta fase se define cómo se organizará y estructurará el software:

- **Interfaz de usuario (GUI y UX/UI)**: Se diseña la interfaz con un enfoque en la experiencia del usuario (ej., creando un árbol de navegación en herramientas como Figma).
- **Bases de datos**:
    - **Ficheros**: Archivos simples que contienen los datos.
    - **Relacionales (SQL)**: Bases de datos estructuradas, donde se realiza el diseño con un **Modelo E/R**, **Modelo Relacional** y **Normalización**.
    - **NoSQL**: Bases de datos para grandes volúmenes de datos o estructuras no rígidas (por ejemplo, Big Data, almacenamiento Clave-Valor en memoria).

### 3. Paradigmas de Programación

El enfoque que se elija para desarrollar el software depende del tipo de proyecto y de los requisitos:

- **Programación Estructurada**: Utiliza diagramas de flujo y pseudocódigo para representar el flujo lógico del programa.
- **Programación Orientada a Objetos (POO)**: Usa objetos y clases para organizar el código, representado mediante **diagramas de clases UML**.
- **Programación Basada en Eventos (POE)**: Se basa en respuestas a eventos, como los clics del ratón.
- **Patrón de Diseño**: Soluciones estandarizadas a problemas comunes.
- **Arquitectura del Software**:
    - **Monolítica**: Todo el código está contenido en un único ejecutable.
    - **Microservicios**: Descomposición del sistema en pequeños servicios independientes (por ejemplo, **AWS**).

### 4. Codificación

En esta fase, se pasa del diseño a la implementación del código fuente utilizando un **IDE** (Entorno de Desarrollo Integrado). También se utilizan herramientas de **control de versiones** como **Git** para gestionar cambios y colaborar en equipo.

### 5. Pruebas (Beta)

Se realizan pruebas para asegurar que el software funcione correctamente:

- **Interfaz de usuario**: Se prueba la interacción con el sistema, tanto en consola como en ventanas (GUI).
- **Pruebas unitarias**: Se prueban partes del código por separado, utilizando herramientas como **JUnit**.
- **Pruebas de integración (e2e)**: Se integran los diferentes componentes del sistema para asegurar que funcionen correctamente juntos.

### 6. Documentación

La documentación es esencial para garantizar que el software sea comprensible durante su ciclo de vida:

- **Planificación del proyecto**: Usar herramientas como **Scrum**, **Trello** o **GitHub** para gestionar tareas y seguimiento.
- **Requisitos**: Documentar tanto los requisitos funcionales como los no funcionales e informáticos.
- **Diseño y arquitectura**: Describir cómo se estructurará el sistema y qué tecnologías se utilizarán.
- **Manual técnico**: Crear una **API** (Interfaz de Programación de Aplicaciones) para facilitar la interacción con el sistema.
- **Pruebas**: Asegurarse de que las pruebas se documenten y sigan el enfoque de **TDD** (Desarrollo Guiado por Pruebas).
- **Mantenimiento y actualizaciones**: Mantener documentación actualizada sobre el proceso de mantenimiento.

### 7. Explotación

Una vez que el software está listo, se pasa a la fase de explotación:

- **Compilación y creación de ejecutables**: El código se transforma en un archivo ejecutable listo para su distribución.
- **Configuración de bases de datos y servidores**: Preparar el entorno de ejecución.
- **Despliegue y puesta en marcha**: Implementación del software en el entorno de producción.
- **Monitoreo del uso**: Se monitorea el rendimiento mediante indicadores clave de rendimiento (**KPI**), como el tiempo de carga de la página web.

### Modelo de Traducción

Dependiendo del lenguaje de programación, el proceso de traducción del código fuente a ejecutable varía:

- **Compilación (C/C++)**:
    - `prog.c` → Compila → `prog.obj` (código objeto) → Enlaza → `prog.exe` (ejecutable).
- **Máquina Virtual (Java y la JVM)**:
    - `prog.java` → Compila → `prog.class` (BYTECODES) → Enlaza → `prog.jar` (ejecutable).
    - La **JVM** interpreta los **BYTECODES**, permitiendo la portabilidad del software (es decir, "escribe una vez, ejecuta en todas partes").
- **Transpilado (TypeScript a JavaScript)**: El código TypeScript se transpila a JavaScript para ser ejecutado en navegadores.

### 8. Mantenimiento

El mantenimiento asegura que el software siga funcionando correctamente a lo largo del tiempo:

- **Monitorización**: A través de los **KPI**, se observa el rendimiento y la disponibilidad del software.
- **Desarrollo de nuevas funcionalidades**: Agregar nuevas características según las necesidades de los usuarios o del negocio.
- **Corrección de errores**: Resolver problemas y bugs identificados durante el uso del software.

## Modelos de Ciclo de Vida del Software

Existen diferentes modelos para gestionar el ciclo de vida del software, adaptados a distintos tipos de proyectos:

- **Modelo Cascada**: Ideal para proyectos con requisitos bien definidos y donde no se prevén muchos cambios.
- **Modelo Incremental**: Apropiado para proyectos en los que los módulos del software se desarrollan de forma secuencial, con requisitos claramente definidos pero susceptibles de evolución.
- **Modelo Espiral**: Útil para proyectos complejos o de alto riesgo, con requisitos que no están completamente definidos desde el principio.
- **Metodologías Ágiles**: Enfoque que promueve entregas continuas y colaborativas, permitiendo adaptarse a cambios de requisitos a lo largo del proyecto.