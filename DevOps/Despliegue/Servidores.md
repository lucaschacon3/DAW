# Servidores

### Sitio web

- Conjunto de paginas web relacionadas y accesibles a partir de un mismo nombre de dominio DNS.
- El conjunto de sitios web de Internet constituyen la WWW.

### Aplicación web

- Aplicación distribuida cuya interfaz de usuario es accesible desde un navegador web.
- El usuario interactúa con un navegador que accede a los servicios y recursos que ofrece un servidor.

### App web vs App escritorio

- Una aplicación de escritorio:
    - Se instala en el equipo. Problemas de compatibilidad por
    HW o SSOO. Tiempo de instalación.
    - Si la BBDD no es local también necesita red.
    - La interfaz dependerá del lenguaje de programación.
- Una aplicación web:
    - No requiere instalación más que en el servidor.
    - Cualquiera accede con acceso por red.
    - Es indiferente la localización de la BBDD.
    - La interfaz siempre es mediante: html, css y javascript, mas
    derivados.

### Pagina web estatica vs dinamica:

- Cuando el cliente genera la peticion al servidor http en una web estatica genera un html que machaca al actual pero no es en vivo, un ejemplo de dinamica son las entradas de un concierto.

### Lenguajes y frameworks en servidor

- C# → ASP.NET Core.
- NodeJs → ExpressJs.
- Python → Django.
- PHP → Symfony - Laravel
- Java → SpringBoot - Java Servlets

---

### URL (tipo de URI) (sirve para llevarte a un recurso especifico de la red)

- Ejemplos
    - http://obelix.dae.es/buscarLibros.php?id=2&tema=Historia
        - Pares de nombre= nombre=valor separados por '&'.
    - http://192.168.1.100/saludos.html
    - http://www.daw.net:8080/datos/practica1.pdf
    - ftp://ftp.rediris.es (FTP es protocolo de transferencia de archivos)
    

---

## Servidores web - Modelo cliente-servidor

- Todo lo que se hace se localiza en el servidor, el cliente da la interfaz.
- El cliente mediante http hace una peticion al servido web (Apache), este envía un documento HTML y el código de las aplicaciones al cliente y éste, mediante el navegador, las ejecuta.
- Rangos de IP privada
    - Clase A: 10.0.0.0 a 10.255.255.255.
    - Clase B: 172.16.0.0 a 172.31.255.255.
    - Clase C: 192.168.0.0 a 192.168.255.255.

### Protocolos

- HTTP:
    - Procesan peticiones http en el puerto 80/TCP(protocolo de trasporte). Es en texto plano por lo que se puede descifrar - inseguro.
    - HTTP es un protocolo “sin estado”.
        - Cada transferencia de datos es independiente de la anterior sin ninguna relación entre ellas. Por cada objeto que se transfiere por la red se realiza una conexión independiente.
    - Proxies Web o HTTP: aplicaciones intermedias entre clientes y servidores que actúan de cortafuegos y/o almacenamiento caché para aumentar el rendimiento.
    - La version actual es la http/1.1 y la http/2.
    - Así funciona un protocolo http.
    
    - Existen los mensajes de peticion y de respuesta.
        
        
    - Tipos de peticion → get, post, option, head, put, delete, trace, connect, path.
        - GET : Para obtener informacion del servidor, se usa al introducir una URL en el navegador, un hiperenlace o cuando se envia un formulario GET. Puede enviar parametros al servidor en la URL (QueryString). No envian el cuerpo del mensaje La informacion es limitada y no se pueden enviar archivos.
        - POST: Para solicitar al servidor que acepte información que se envía adjunta en una petición. Envian el cuerpo del mensaje, por lo que no se ve en la URL. Se usa en los formularios POST. Los pares nombre/valor se puden incluir en la peticion y respuesta.
    - Tipos de cabeceras
        - Cabeceras Generales:
            - Date
            - Connection
            - Cache-Control
            - Transfer-Encoding
        - Cabeceras de Solicitud:
            - User-Agent
            - Accept
            - Accept-Language
            - Host
            - Referer
        - Cabeceras de Respuesta:
            - Server
            - Age
            - Location
            - Retry-After
            - WWW-Authenticate
        - Cabeceras de Entidad:
            - Content-Type
            - Content-Length
            - Content-Encoding
            - Content-Language
            - Last-Modified
            - Last-Modified

    - Códigos de estado y error
        - 1xx (Informativos):Indican que la solicitud fue recibida y el servidor está procesando la petición, es decir, el cliente puede continuar con la solicitud.
        - 2xx (Éxito):Indican que la solicitud fue recibida, comprendida y procesada ,es decir, la solicitud fue correcta y el servidor ha devuelto la respuesta solicitada.
        - 3xx (Redirección):Indican que el cliente debe realizar una acción adicional para completar la solicitud. El recurso ha sido movido de forma permanente a una nueva URL.
        - 4xx (Errores del cliente):Indican que la solicitud tiene un error y no puede ser procesada. El servidor no puede encontrar el recurso solicitado.
        - 5xx (Errores del servidor): Indican que el servidor ha encontrado un error o no puede completar la solicitud.
        
    
- HTTPS
    - Escucha en el puerto 443 (como el http pero va cifrado - seguro).
    - Seguridad https → es un protocolo que usa SSL o TSL para encapsular mensajes http, utiliza el puerto TCP/443 para escuchar las peticiones de los clientes.
        
    
    - Arquitectura a 3 niveles (capa presentacion/negocio/datos) y MVC(modelo vista controlador).
- TCP
    - Es el protocolo de transporte cliente-servidor.
    - TCP funciona de la siguiente manera:
        - **Divide los datos**: Cuando envías algo por Internet, TCP corta la información en pedacitos pequeños (llamados "paquetes").
        - **Envía los paquetes**: TCP se asegura de que todos los pedacitos se envíen correctamente a la dirección de destino.
        - **Verifica la entrega**: Cuando los paquetes llegan al destino, TCP comprueba que todos los pedacitos llegaron bien. Si falta alguno, vuelve a pedirlo.
        - **Rearma los datos**: Una vez que todos los paquetes llegan, TCP los pone en el orden correcto para que puedas ver el mensaje completo (como si reuniera las páginas de la carta).
    - Orden en una aplicacion:
        - App (aplicacion http)
        - TCP (transporte)
        - IP (enlace y red)
        - Medio (fisico)
    
- DNS
    - Es el sistema de nombres de dominio, es como la libreta de contactos de Internet. En lugar de recordar una dirección IP, el DNS convierte a nombres ej: **Google DNS (8.8.8.8 y 8.8.4.4).**
- FTP
    - Es el protocolo de transferencia de archivos, basado en arquitectura cliente-servidor.
    - FTP utiliza TCP, es exclusivo para cliente servidor.
    - Escucha en el puerto 20 y 21.
    

---

### Herramientas Cliente - Servidor

- Cookies → Informacion que envia un servidor en una respuesta http y que el navegador almacena, el navegador puede enviar la cookie en solicitudes posteriores al mismo servidor (guarda informacion sobre tu visita).
- Memoria caché → Hay servidores que almacenan informacion por largos periodos, por lo que http almacena en memoria cache para evitar el trafico innecesario.
- Autenticación → Para controlar el acceso a los recursos del servidor, se usa Basic o Digest basados en código de estado 401 y Cabeceras WWW-Authenticate y Authoritation.
- Redireccionamiento → HTTP permite a los servidores y proxies redirigir las peticiones a
otras localizaciones. Situaciones:
    - El contenido de un servidor se ha movido a una URI o URL distinta.
    - Convertir una solicitud POST en una solicitud GET.
    - Redirigir las peticiones a otro proxy.
    - Redirigir peticiones a servlets, JSPs, ASPs, PHP, etc.
- Conexiones persistentes →Consiste en que varias peticiones y respuestas sean transferidas
usando la misma conexión TCP. Su uso reduce el número de conexiones TCP, lo que redunda en menor gasto de CPU/memoria y en una reducción de los tiempos de respuesta.
- El alojamiento virtual permite que varios sitios web compartan un solo servidor físico por ello reduce costos. Un servidor web puede alojar múltiples dominios en la misma dirección IP, respondiendo a las solicitudes de cada sitio de manera independiente.
    
    Existen tres tipos principales de alojamiento virtual (todas funcionan en servidores como Apache y optimiza el uso del hardware y la gestion de sitios web).
    
    - **Alojamiento basado en nombres:** Usa el nombre del dominio para identificar el sitio web solicitado. Es el más común y permite que varios sitios compartan una sola IP.
    - **Alojamiento basado en IP:** Cada sitio web tiene una dirección IP única.
    - **Alojamiento basado en puertos:** Cada sitio se diferencia por el puerto que utiliza.

- **Wireshark** es una herramienta de análisis de red que examina el tráfico de datos de una red. Se utiliza para encotrar problemas, ver el rendimiento y detectar actividades maliciosas.
    
    Captura de tráfico y análisis de paquetes: Permite analizar paquetes de datos de la red, dando información de cada uno.
    
    Análisis de protocolos: Puede analizar protocolos como HTTP, TCP o DNS.
    
    Es una herramienta clave para administradores de redes y encargados de seguridad informática que necesitan visibilidad total de la red.
    

---

### Comandos

- Para ver tu ip:
    - comando ip a
    
- Puertos:
    - Por debajo del 1024 estan reservados para el admin.
    - Para ver los puertos: cat /etc/services
    - Para ver los procesos: netstat -t (para los que estan escuchando: netstat -tl)
- Para conectar:
    - HTTPS → openssl s_client -connect www.ejemplo.com:443
        - Despues:
            - GET/HTTP/1.1
            - host: www.ejemplo.com
            - connection: close
    - ping (ip / sitio web) → ping www.google.com → para comprobar si hay conexion.
    - nslookup (ip / sitio web) →nslookup www.google.com → para ver informacion como la ip.
    - Comando nc:
        - nc -C4t ip puerto
        - nc -C4t puerto (por encima de 1024)
        - nc google.com 80 → despues → GET / HTTP/1.1 Host: google.com
    - Para informacion de la red:
        - curl -D - www.google.com
        - wget -S - www.google.com
        - Para saber tu ip publica, el ordenador no la sabe por ello hay que acudir a paginas:
            - curl ifconf.me
            - curl ip.me
            - geolocalizacion → curl ipinfo.io