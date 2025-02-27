# Apache2

## **1. Instalación de Apache2**

- **Actualizar repositorios**:`sudo apt update`
- **Instalar Apache2**:`sudo apt install apache2`
- **Verificar estado**:`sudo systemctl status apache2`
- Reiniciar Apache: `sudo systemctl restart apache2`
- Detener Apache: `sudo systemctl stop apache2`
- **Comprobar en navegador**:
    - Modifica index.html en `var/www/html/index.html`
    - Accede a `http://localhost/`

---

## **2. Archivos de configuración de Apache**

- **Ubicación principal**: `/etc/apache2/`
- **Archivos relevantes**:
    - `apache2.conf`: Configuración principal.
    - `sites-available/` y `sites-enabled/`: Configuración de sitios (activar/desactivar con `a2ensite` y `a2dissite`).
    - `mods-available/` y `mods-enabled/`: Módulos de Apache (activar/desactivar con `a2enmod` y `a2dismod`).
    - Ejemplo
        - Habilitar sitio: `sudo a2ensite <sitio.conf>`
        - Deshabilitar sitio: `sudo a2dissite <sitio.conf>`
        - Habilitar módulo: `sudo a2enmod <modulo>`
        - Deshabilitar módulo: `sudo a2dismod <modulo>`
    - **Directiva `Include`**: Permite cargar configuraciones adicionales.
- **Módulos activos por defecto**: `apachectl -M`

---

## **3. Modificación de /etc/hosts**

- **Editar con `nano`**: `sudo nano /etc/hosts`
- **Ejemplo**: `127.0.1.1 nombre1 nombre2`

---

## **4. Cambios en configuración**

### **4.1. Cambiar puerto de escucha a 8080**

- **Modificar `ports.conf`**: `sudo nano /etc/apache2/ports.conf`
    
    Cambiar `Listen 80` a `Listen 8080`.
    
- **Modificar `000-default.conf`**: `sudo nano /etc/apache2/sites-available/000-default.conf`
    
    Cambiar `<VirtualHost *:80>` a `<VirtualHost *:8080>`.
    
- **Reiniciar Apache:** `sudo systemctl restart apache2`

### **4.2. Personalizar index.html**

- **Ubicación**: `/var/www/html`
- **Editar con `nano`**: `sudo nano /var/www/html/index.html`

### **4.3. Crear carpeta sin `index.html`**

- **Crear carpeta**: `sudo mkdir /var/www/html/carpeta`
- **Añadir archivos**: `sudo nano /var/www/html/carpeta/archivo1.txt`
- **Desactivar listados de directorios:** `sudo nano /etc/apache2/apache2.conf`
    
    Cambiar `Options -Indexes`.
    

### **4.4. Alias para carpeta fuera de DocumentRoot**

- **Modificar `000-default.conf`**:
    
    Añadir un Alias para ruta diferente:
    
    ```
    Alias /tmp/ "/ruta/otra/carpeta/"
    <Directory "/ruta/otra/carpeta">
        Options Indexes FollowSymLinks
        AllowOverride None
        Require all granted
    </Directory>
    
    ```
    
- **Crear carpeta con archivo HTML**:
    
    `sudo mkdir -p /ruta/otra/carpeta`
    
    `sudo nano /ruta/otra/carpeta/archivo.html`
    

### **4.5. Ver registros**

- **Ver `access.log`**: `cat /var/log/apache2/access.log`
- Ver logs en tiempo real: `sudo tail -f /var/log/apache2/error.log`
- **Ver `error.log`**: `cat /var/log/apache2/error.log`

---

## **5. Creación de sitios virtuales**

### **5.1. Crear sitios virtuales con nombres en `/etc/hosts`**

- **Añadir a `/etc/hosts`**:
    
    `127.0.1.1 sitio1.local sitio2.local`
    
- **Crear archivos de configuración**:
    
    `sudo cp /etc/apache2/sites-available/000-default.conf /etc/apache2/sites-available/sitio1.conf`
    
    `sudo cp /etc/apache2/sites-available/000-default.conf /etc/apache2/sites-available/sitio2.conf`
    
- **Editar `sitio1.conf` y `sitio2.conf`**:
    
    ```
    <VirtualHost *:8080>
        ServerName sitio1.local
        DocumentRoot /var/www/sitio1
    </VirtualHost>
    
    ```
    
- **Crear carpetas y archivos HTML**:
    
    `sudo mkdir /var/www/sitio1`
    
    `sudo nano /var/www/sitio1/index.html`
    
    Repetir para `sitio2`.
    
- **Activar sitios y reiniciar**:
    
    `sudo a2ensite sitio1.conf`
    
    `sudo a2ensite sitio2.conf`
    
    `sudo systemctl restart apache2`
    

### **5.2. Registros separados para cada sitio**

- **Editar `sitio1.conf` y `sitio2.conf`**:
    
    ```
    CustomLog /var/log/apache2/sitio1_access.log combined
    ErrorLog /var/log/apache2/sitio1_error.log
    
    ```
    

---

---

## **6. Pruebas de carga con Apache Benchmark**

### **6.1. Realizar peticiones**

Instalar `ab`: `sudo apt install apache2-utils`

Ejecutar prueba: `ab -c 10 -n 1000 http://localhost/index.html`

---

## **7. Opciones adicionales**

### **7.1. XAMPP o WAMP**

- **Instalar XAMPP**:
XAMPP ofrece una instalación rápida de Apache, PHP y MySQL con configuraciones predeterminadas. Facilita la administración de servicios y cambios de versiones.

### **7.2. Módulos adicionales de Apache**

- **`userdir`**: Permite a los usuarios tener directorios personales para alojar sitios web.
    
    Habilitar:`sudo a2enmod userdir`
    
- **`info`, `status`, `alias`, `dir`, `autoindex`**:
    - **`info`**: Muestra configuración interna de Apache.
    - **`status`**: Muestra el estado y rendimiento de Apache.
    - **`alias`**: Mapea URLs a directorios fuera de DocumentRoot.
    - **`dir`**: Define el archivo principal en directorios.
    - **`autoindex`**: Muestra listado de archivos cuando no hay `index.html`.

---

## 8. **SSL/HTTPS**

- Habilitar SSL: `sudo a2enmod ssl`
- Crear certificado:
    
    ```bash
    sudo openssl req -x509 -newkey rsa:4096 -keyout /etc/ssl/private/apache-selfsigned.key -out /etc/ssl/certs/apache-selfsigned.crt -days 365
    
    ```
    
- Configurar en `default-ssl.conf` y habilitar sitio SSL:
    
    ```bash
    sudo a2ensite default-ssl.conf
    sudo systemctl reload apache2
    
    ```
    

---

## 9. **Manejo de Usuarios**

- El usuario predeterminado para Apache es **`www-data`**. Para cambiar permisos de directorios, usa:
    
    ```bash
    sudo chown -R www-data:www-data /var/www/html
    
    ```
    

## 10. **Autenticación**

- **Protección básica con `.htpasswd`**:
    - Crear archivo `.htpasswd` con `htpasswd -c /path/to/.htpasswd username`
    - Configurar `.htaccess` para requerir autenticación.

## 11. **Modificaciones de Configuración Común**

- **`AllowOverride`**: Permite `.htaccess`.
- **`ServerAdmin`**: Configura el correo del administrador.
- **`DocumentRoot`**: Define el directorio raíz de los sitios.

## 12. **Optimización**

- **Habilitar compresión**: Configura `mod_deflate` para mejorar la velocidad de carga.
- **Caching**: Habilitar `mod_cache` para almacenar contenido en caché.