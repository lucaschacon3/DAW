### **1. Creación y Configuración de una Instancia EC2**

1. **Acceso a EC2**:
    - Inicia sesión en AWS Academy.
    - Ve al apartado de **Servicios** y selecciona **EC2**.
2. **Creación de la Instancia**:
    - **Sistema operativo**: Ubuntu.
    - **Arquitectura**: Por defecto para el SO elegido.
    - **Tipo de instancia**: Selecciona una con **1GB de RAM y 1 CPU** (generalmente *t2.micro* es gratuito).
    - **Key Pair**:
        - Crea un nuevo par de claves.
        - Descarga el archivo `.pem` para autenticación SSH.
    - **Puertos permitidos**:
        - **22** para SSH.
        - **80** para HTTP.
        - **443** para HTTPS.
    - **Almacenamiento**: Selecciona tipo **gp3**.
3. **Lanzar la Instancia**:
    - Haz clic en **Launch Instance**.
    - Una vez creada, estará corriendo.

---

### **2. Conexión a la Instancia por SSH**

1. **Permisos del archivo `.pem`**:
    - Cambia los permisos del archivo para que solo el propietario pueda leerlo:
        
        ```bash
        chmod 400 nombre_fichero.pem
        
        ```
        
2. **Conexión a la máquina virtual**:
    - Obtén el DNS público en la información de la instancia.
    - Conéctate mediante SSH:
        
        ```bash
        ssh -i nombre_fichero.pem ubuntu@<DNS>
        
        ```
        

---

### **3. Instalación y Configuración de Apache2**

1. **Instalar Apache2**:
    
    ```bash
    sudo apt install apache2
    
    ```
    
2. **Modificar el archivo HTML por defecto**:
    - Cambiar permisos al archivo:
        
        ```bash
        sudo chmod 775 /var/www/html/index.html
        
        ```
        
    - También puedes cambiar permisos de la carpeta completa (no recomendado):
        
        ```bash
        sudo chmod -R 777 /var/www/html
        
        ```
        
3. **Editar el archivo**:
    - Usa un editor de texto como `vi` o `nano`:
        
        ```bash
        sudo nano /var/www/html/index.html
        
        ```
        
4. **Acceso al servidor**:
    - Visita `http://<DNS>` para ver tu página.

---

### **4. Instalación y Configuración de Nginx**

1. **Instalar Nginx**:
    
    ```bash
    sudo apt install nginx
    
    ```
    
2. **Modificar el archivo de inicio**:
    - Cambiar permisos al archivo por defecto:
        
        ```bash
        sudo chmod 775 /var/www/html/index.nginx-debian.html
        
        ```
        
    - Edítalo usando `nano`:
        
        ```bash
        sudo nano /var/www/html/index.nginx-debian.html
        
        ```
        
3. **Gestión de servidores web**:
    - Si tienes **Apache2** y **Nginx** instalados, solo uno puede usar el puerto 80 a la vez.
    - Para detener uno de los servicios:
        
        ```bash
        sudo systemctl stop apache2
        sudo systemctl stop nginx
        
        ```
        

---

### **5. Conceptos Clave en AWS Cloud Foundations**

1. **Conceptos Fundamentales**:
    - **Elasticidad**: Escala automáticamente según la demanda.
    - **Agilidad**: Implementación rápida de recursos.
    - Modelos de servicio:
        - **IaaS**: Infraestructura como Servicio.
        - **PaaS**: Plataforma como Servicio.
        - **SaaS**: Software como Servicio.
2. **Servicios Principales de AWS**:
    - **Amazon EC2**: Instancias de servidores virtuales.
    - **Amazon S3**: Almacenamiento de objetos.
    - **Amazon RDS**: Gestión de bases de datos relacionales.
    - **AWS Lambda**: Ejecución de código sin servidores.
    - **Amazon VPC**: Redes privadas virtuales.
3. **Seguridad en AWS**:
    - **IAM**: Gestión de identidades y permisos.
    - **Monitoreo**: Uso de CloudTrail para registrar actividad.
4. **Facturación y Precios**:
    - Pago por uso.
    - Reservas a largo plazo para reducir costos.
    - Herramientas como **AWS Cost Explorer** y **AWS Budgets**.

---

### **6. Resumen de la Práctica**

1. **Pasos básicos realizados**:
    - Creación de instancia EC2.
    - Configuración de permisos y conexión SSH.
    - Instalación y configuración de Apache2 y Nginx.
2. **Puntos clave aprendidos**:
    - Gestión básica de servidores web en AWS.
    - Alternancia entre servidores en una sola máquina.
    - Importancia de permisos en archivos sensibles (e.g., `.pem`).
3. **Herramientas utilizadas**:
    - Terminal para comandos básicos.
    - Editores de texto como `vi` y `nano`.
    - Interfaz de AWS para administración de instancias.

---

### **Tips Importantes**

- **Seguridad**:
    - Nunca compartas tu archivo `.pem`.
    - Configura reglas de seguridad estrictas para tus puertos.
- **Gestión de costos**:
    - Apaga las instancias cuando no las uses para evitar cargos innecesarios:
        
        ```bash
        sudo shutdown now
        
        ```