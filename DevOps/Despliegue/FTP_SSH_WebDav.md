# FTP - SSH - WebDav

## **1. FTP (File Transfer Protocol)(obsoleto)**

FTP es un protocolo estándar de la capa de aplicación utilizado para la transferencia de archivos entre un servidor y un cliente a través de una red TCP/IP. **No cifra las conexiones**, lo que lo hace vulnerable a ataque

### **Comandos y Ejemplos**

- **Conexión básica (Linux/Windows)**:
    
    ```bash
    ftp test.rebex.net
    
    ```
    
    - **Usuario:** `demo`
    - **Contraseña:** `password`
- **Subir archivo usando FTP (Linux)**:
    
    ```bash
    put archivo.txt
    
    ```
    
- **Descargar archivo (Linux)**:
    
    ```bash
    get archivo.txt
    
    ```
    
- **Ver el contenido remoto (Linux)**:
    
    ```bash
    ls
    
    ```
    

### **Ventajas**

- Fácil de implementar.
- Ideal para transferencias de archivos simples.

### **Desventajas**

- **No seguro** (los datos, incluidas las contraseñas, se transmiten en texto claro).
- No adecuado para datos sensibles.

## **2. FTPS (FTP Secure)**

FTPS es una versión segura de FTP que utiliza **TLS (Transport Layer Security)** o **SSL (Secure Sockets Layer)** para cifrar las conexiones.

### **Comandos y Ejemplos**

- **Conexión FTPS con `lftp` (Linux)**:
    
    ```bash
    
    lftp -u usuario,contraseña ftps://ftp.servidor.com
    
    ```
    
- **Subir archivo usando FTPS**:
    
    ```bash
    
    put archivo_secreto.txt
    
    ```
    
- **Descargar archivo usando FTPS**:
    
    ```bash
    
    get archivo_importante.txt
    
    ```
    

### **Ventajas**

- **Cifrado**: protege los datos durante la transmisión.
- Compatible con servidores FTP tradicionales (si soportan TLS/SSL).

### **Desventajas**

- Más complicado de configurar que FTP.
- Algunos cortafuegos pueden bloquear conexiones FTPS debido al uso de múltiples puertos.

---

## **3. SFTP (SSH File Transfer Protocol)**

SFTP es un protocolo de transferencia de archivos que utiliza SSH para proporcionar una conexión segura. Es **completamente diferente de FTP** y no requiere un servidor FTP tradicional.

### **Comandos y Ejemplos**

- **Conexión básica (Linux)**:
    
    ```bash
    
    sftp usuario@servidor.com
    
    ```
    
- **Subir archivo usando SFTP**:
    
    ```bash
    
    put archivo_seguro.txt
    
    ```
    
- **Descargar archivo usando SFTP**:
    
    ```bash
    
    get archivo_importante.txt
    
    ```
    
- **Explorar el sistema de archivos remoto**:
    
    ```bash
    
    ls
    
    ```
    

### **Ventajas**

- **Altamente seguro**: utiliza cifrado SSH.
- Solo requiere que el servidor tenga SSH configurado, lo que simplifica la infraestructura.
- Funciona bien a través de cortafuegos.

### **Desventajas**

- Más lento que FTP debido al cifrado.
- Requiere herramientas compatibles con SSH.

---

## **Comparativa entre FTP, FTPS y SFTP**

| **Característica** | **FTP** | **FTPS** | **SFTP** |
| --- | --- | --- | --- |
| **Seguridad** | Sin cifrado | Cifrado TLS/SSL | Cifrado SSH |
| **Compatibilidad** | Ampliamente soportado | Ampliamente soportado | Requiere cliente SSH |
| **Facilidad de configuración** | Fácil | Moderada | Moderada |
| **Velocidad** | Alta | Alta | Moderada (por cifrado) |
| **Uso típico** | Transferencia básica | Transferencia segura en redes confiables | Transferencia segura en redes inseguras |

## **4. SSH (Secure Shell)**

SSH es un protocolo seguro que permite la administración remota de sistemas y la transferencia de archivos a través de una red. Utiliza cifrado para proteger los datos.

### **Comandos y Ejemplos**

- **Instalación (Linux)**:
    
    ```bash
    sudo apt install openssh-server
    
    ```
    
- **Conexión remota (Linux)**:
    
    ```bash
    ssh usuario@192.168.1.10
    
    ```
    
- **Transferir archivos (SCP)**:
    
    ```bash
    scp archivo.txt usuario@192.168.1.10:/ruta/remota
    
    ```
    
- **Generación de claves SSH**:
    
    ```bash
    ssh-keygen
    
    ```
    
- **Copiar claves SSH al servidor**:
    
    ```bash
    ssh-copy-id usuario@192.168.1.10
    
    ```
    

### **Ventajas**

- **Seguro** (cifra todo el tráfico).
- Permite ejecutar comandos de forma remota.
- **Autenticación por clave**: elimina la necesidad de contraseñas.

### **Desventajas**

- Requiere configuración inicial (claves SSH).
- Puede ser más complicado de configurar que otros protocolos.

---

## **5. WebDAV (Web-based Distributed Authoring and Versioning)**

WebDAV es una extensión del protocolo HTTP que permite la edición y gestión de archivos en servidores web. Facilita la colaboración y la edición remota de documentos. Funciona como un Drive.

### **Comandos y Ejemplos**

- **Instalar WebDAV en Apache (Linux)**:
    
    ```bash
    sudo apt install apache2
    sudo a2enmod dav dav_fs
    sudo systemctl restart apache2
    
    ```
    
- **Configurar acceso WebDAV en Apache**:
    
    ```bash
    <Directory /var/www/webdav>
        Dav On
        AuthType Basic
        AuthName "Restricted Access"
        AuthUserFile /etc/apache2/.htpasswd
        Require valid-user
    </Directory>
    
    ```
    
- **Montar WebDAV en Linux (desde un explorador de archivos)**:
    - Usar `dav://` en el explorador de archivos:
    
    ```bash
    dav://192.168.1.10/webdav
    
    ```
    
- **Conexión desde Windows (Explorador de Archivos)**:
    - `http://192.168.1.10/webdav`

### **Ventajas**

- Permite **trabajo colaborativo** con archivos en servidores web.
- Usado comúnmente en **gestión de contenido** (CMS) y **almacenamiento en la nube**.

### **Desventajas**

- Seguridad basada en autenticación básica o mediante tokens (requiere HTTPS para proteger las credenciales).
- No cifrado por defecto (es vulnerable si no se configura correctamente).

---

## **Comparación entre FTP, SSH y WebDAV**

| **Característica** | **FTP (TCP/IP)** | **SSH** | **WebDAV** |
| --- | --- | --- | --- |
| **Seguridad** | No cifrado | Cifrado (cifrado de extremo a extremo) | Depende de la configuración (requiere HTTPS) |
| **Facilidad de uso** | Sencillo | Requiere configuración de claves | Fácil, con soporte en navegadores |
| **Uso principal** | Transferencia de archivos simples | Administración remota de sistemas | Gestión de archivos en red |
| **Autenticación** | Usuario/Contraseña | Claves SSH o contraseñas | Usuario/Contraseña |
| **Protocolos cifrados** | No | Sí | Solo con HTTPS |

---

## **6. SSH en Android**

En Android, puedes usar aplicaciones como **Termux** o **JuiceSSH** para acceder a servidores SSH y realizar tareas de administración remota.

### **Ejemplo de uso en Android (Termux)**:

1. **Instalar Termux desde la Play Store.**
2. **Conectar a un servidor SSH**:
    
    ```bash
    ssh usuario@192.168.1.10
    
    ```
    

### **Ventajas**

- Acceso remoto desde cualquier lugar.
- Administra servidores de manera sencilla desde el móvil.

---

## **7. Modelos P2P vs. Cliente/Servidor**

- **P2P (Peer-to-Peer)**:
    - **Descripción**: Cada usuario actúa como servidor y cliente.
    - **Ejemplo**: Compartir archivos mediante **BitTorrent**.
    - **Ventajas**: No depende de un servidor central, lo que reduce el riesgo de caídas.
    - **Desventajas**: Difícil de controlar y administrar, puede ser más vulnerable.
- **Cliente/Servidor**:
    - **Descripción**: El servidor central proporciona servicios y recursos a los clientes.
    - **Ejemplo**: FTP, WebDAV, servidores SSH.
    - **Ventajas**: Mayor control y seguridad centralizada.
    - **Desventajas**: La caída del servidor afecta a todos los usuarios.

---

## **Conclusión General**

- **FTP** es adecuado para transferencias simples de archivos, pero no es seguro. **SFTP** o **FTPS** son más recomendables para seguridad.
- **SSH** es ideal para administración remota de servidores y transferencia de archivos segura.
- **WebDAV** es útil para compartir y editar archivos de manera colaborativa, pero carece de seguridad por defecto.
- **SSH** es accesible desde dispositivos móviles mediante apps como **Termux** en Android.

---

Este esquema cubre los aspectos más importantes de cada protocolo, sus ventajas, desventajas, y ejemplos prácticos de uso. Si deseas realizar configuraciones más avanzadas, cada uno de estos protocolos puede ser personalizado según tus necesidades.