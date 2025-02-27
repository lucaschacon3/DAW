# DNS

### **1. Introducción al DNS (Domain Name System)**

- **Definición**: El DNS es el sistema que traduce los nombres de dominio legibles por humanos (como `www.google.com`) en direcciones IP (como `142.250.185.46`), que son utilizadas por los ordenadores para comunicarse a través de Internet.
- **Importancia**: Sin DNS, sería necesario recordar direcciones IP de los sitios web, lo cual sería impráctico. El DNS simplifica este proceso y mejora la accesibilidad en la red.

---

### **2. Estructura Jerárquica del DNS**

El sistema DNS tiene una estructura jerárquica con diferentes niveles:

- **Root (raíz)**: Es el nivel más alto y contiene los servidores raíz que conocen la ubicación de los servidores autoritativos de los dominios de primer nivel (TLD).
- **TLD (Top-Level Domain)**: Son los dominios de nivel superior, como `.com`, `.net`, `.org`, `.gov`, `.edu` y dominios de país como `.es`, `.mx`, `.uk`.
- **Segundo Nivel**: Es el nombre del dominio propiamente dicho, como `google` en `google.com`.
- **Tercero y Niveles Inferiores**: Son subdominios, como `www` en `www.google.com`.

---

### **3. Tipos de Servidores DNS**

- **Servidores Raíz**: Contienen información sobre los TLDs y están distribuidos globalmente. No almacenan información sobre dominios específicos, pero saben a dónde referir las consultas para los TLDs.
- **Servidores Autoritativos**: Son responsables de proporcionar la información definitiva sobre un dominio. Pueden ser de dos tipos:
    - **Primario (Master)**: Almacena los registros de los dominios.
    - **Secundario (Slave)**: Replica la información del servidor primario.
- **Servidores Recursivos**: Actúan como intermediarios entre el cliente y los servidores autoritativos. Realizan las consultas necesarias a otros servidores para resolver una petición.

---

### **4. Registros DNS**

- **A (Address)**: Mapea un nombre de dominio a una dirección IPv4. Ejemplo: `example.com A 192.168.1.1`.
- **AAAA (IPv6 Address)**: Mapea un nombre de dominio a una dirección IPv6. Ejemplo: `example.com AAAA 2001:0db8::1`.
- **NS (Name Server)**: Especifica los servidores que gestionan un dominio. Ejemplo: `example.com NS ns1.example.net`.
- **MX (Mail Exchange)**: Define los servidores de correo para un dominio. Ejemplo: `example.com MX mail.example.com`.
- **CNAME (Canonical Name)**: Alias de un dominio, se utiliza para redirigir un nombre de dominio a otro. Ejemplo: `www.example.com CNAME example.com`.
- **SOA (Start of Authority)**: Contiene información esencial sobre el dominio, como el servidor autoritativo, el correo del administrador, y los parámetros de actualización. Ejemplo: `example.com SOA ns1.example.net admin.example.com`.
- **PTR (Pointer)**: Utilizado para la resolución inversa de direcciones IP a nombres de dominio.

---

### **5. Resolución de Nombres**

El proceso de resolución de nombres se lleva a cabo en varias etapas:

1. **Consulta del cliente**: Un usuario o aplicación envía una solicitud DNS.
2. **Consulta recursiva**: Si el servidor recursivo no tiene la respuesta, comienza a buscar desde los servidores raíz.
3. **Consulta a los servidores raíz**: El servidor recursivo pregunta al servidor raíz por el TLD adecuado.
4. **Consulta al servidor autoritativo**: El servidor recursivo obtiene la respuesta final del servidor autoritativo que tiene los registros del dominio.

**FQDN (Fully Qualified Domain Name)**: Nombre de dominio completamente cualificado que especifica la ubicación exacta de un dominio en la jerarquía del DNS.

---

### **6. Herramientas Comunes**

- **`dig`**: Herramienta para realizar consultas DNS desde la línea de comandos.
    - Ejemplo:
        
        ```bash
        dig example.com
        
        ```
        
        Devuelve información sobre el dominio `example.com`.
        
    - Para ver la ruta de resolución de un dominio:
        
        ```bash
        dig +trace example.com
        
        ```
        
- **`nslookup`**: Otra herramienta para consultas DNS. Puede funcionar en modo interactivo.
    - Ejemplo:
        
        ```bash
        nslookup example.com
        
        ```
        
- **`whois`**: Utilizada para obtener información sobre la propiedad de un dominio.
    - Ejemplo:
        
        ```bash
        whois example.com
        
        ```
        

---

### **7. Conceptos Avanzados**

- **Caché DNS**: Los servidores y clientes pueden almacenar en caché las respuestas a las consultas DNS para mejorar el rendimiento. Esto significa que una consulta repetida a un dominio puede resolverse más rápidamente sin consultar nuevamente los servidores autoritativos.
- **TTL (Time to Live)**: Especifica cuánto tiempo un registro DNS puede permanecer en caché antes de que deba consultarse nuevamente al servidor autoritativo.
- **DNSSEC (DNS Security Extensions)**: Extensiones que proporcionan autenticación y protección contra ataques como la falsificación de respuestas (DNS Spoofing).
- **DNS Dinámico (DDNS)**: Permite que un dominio apunte a una IP que cambia con el tiempo (útil para conexiones a Internet con IP dinámica).

---

### **8. Seguridad y Privacidad en DNS**

- **DNS over HTTPS (DoH)**: Cifra las consultas DNS para proteger la privacidad del usuario al evitar la interceptación de consultas por parte de terceros.
- **DNS over TLS (DoT)**: Similar a DoH, pero utiliza el protocolo TLS (Transport Layer Security) en lugar de HTTPS.
- **Ataques Comunes**:
    - **DNS Spoofing (Cache Poisoning)**: Inyección de información incorrecta en la caché DNS de un servidor.
    - **DDoS (Distributed Denial of Service)**: Ataques que utilizan tráfico masivo para saturar los servidores DNS y dejarlos fuera de servicio.

---

### **9. Consultas y Ejemplos Prácticos**

- **Consulta de servidores raíz DNS**:
    
    ```bash
    dig . NS
    
    ```
    
- **Consulta de un registro SOA para un dominio**:
    
    ```bash
    dig example.com SOA
    
    ```
    
- **Consulta recursiva paso a paso**:
    
    ```bash
    dig @8.8.8.8 +trace example.com
    
    ```
    
- **Consultar servidores de correo para un dominio**:
    
    ```bash
    dig example.com MX
    
    ```
    
- **Consultar registros CNAME**:
    
    ```bash
    dig www.example.com CNAME
    
    ```
    

---

### **10. Conclusiones**

- El DNS es fundamental para la operatividad de Internet, proporcionando una capa de abstracción entre los nombres de dominio y las direcciones IP.
- La correcta configuración y mantenimiento de los servidores DNS es esencial para asegurar que los usuarios puedan acceder a los sitios web sin problemas.
- El uso de herramientas como **`dig`**, **`nslookup`** y **`whois`** permite la administración y resolución de problemas DNS con eficiencia.
- Los protocolos de seguridad como **DNSSEC**, **DoH** y **DoT** son esenciales para proteger las consultas DNS y garantizar la integridad de la información.

---

### **11. Proveedores de DNS**

- **DNS Públicos y Gratuitos**:
    - **Google DNS**: `8.8.8.8`, `8.8.4.4`.
    - **Cloudflare DNS**: `1.1.1.1`, `1.0.0.1`.
    - **OpenDNS**: `208.67.222.222`, `208.67.220.220`.
- **Servicios de Hosting y DNS Dinámico**:
    - **No-IP**, **DynDNS**.