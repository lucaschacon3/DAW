# Docker

Docker es una plataforma para desarrollar, desplegar y ejecutar aplicaciones dentro de contenedores. Los siguientes comandos te permitirán gestionar contenedores, imágenes y trabajar de forma eficiente con Docker.

---

### **1. Ver Contenedores e Imágenes**

Comandos para inspeccionar el estado de tus recursos en Docker:

```bash
docker ps               # Ver contenedores en ejecución
docker ps -a            # Ver todos los contenedores (incluidos los detenidos)
docker images           # Ver todas las imágenes disponibles
docker inspect nombre   # Ver detalles de un contenedor o imagen
docker stats            # Ver estadísticas en tiempo real de uso de recursos de los contenedores

```

---

### **2. Iniciar y Parar Contenedores**

Gestiona el ciclo de vida de los contenedores con estos comandos:

```bash
docker start nombre     # Iniciar un contenedor detenido
docker stop nombre      # Detener un contenedor en ejecución
docker restart nombre   # Reiniciar un contenedor
docker pause nombre     # Pausar un contenedor
docker unpause nombre   # Reanudar un contenedor pausado

```

---

### **3. Eliminar Contenedores e Imágenes**

Libera espacio y organiza tus recursos eliminando contenedores e imágenes:

```bash
docker rm id                   # Eliminar un contenedor detenido
docker rmi nombre_imagen       # Eliminar una imagen
docker rm -f id                # Forzar eliminación de un contenedor en ejecución
docker rmi $(docker images -q) # Eliminar todas las imágenes no usadas

```

> Nota: Utilizar -f con cuidado, ya que forzar la eliminación puede interrumpir procesos en curso.
> 

---

### **4. Crear Contenedores**

Comandos para crear y ejecutar contenedores de forma personalizada:

```bash
docker run -p 8080:80 --name apache-daw ubuntu/apache2     # Crear y ejecutar un contenedor de Apache
docker run -d nombre_imagen                               # Crear y ejecutar un contenedor en segundo plano (detached mode)
docker run -it nombre_imagen                              # Crear y acceder a un contenedor en modo interactivo
docker run --rm nombre_imagen                             # Crear y eliminar automáticamente el contenedor al detenerse

```

> Opciones comunes:
> 
> - `p host:contenedor`: Mapea puertos entre la máquina host y el contenedor.
> - `-name nombre`: Asigna un nombre al contenedor.
> - `d`: Ejecuta el contenedor en segundo plano.
> - `-rm`: Elimina automáticamente el contenedor después de detenerse.

---

### **5. Ejecutar Comandos Dentro de Contenedores**

Trabaja dentro de contenedores activos y ejecuta comandos específicos:

```bash
docker exec -it nombre_del_contenedor /bin/bash   # Abrir una terminal dentro del contenedor
docker exec -it nombre comando                   # Ejecutar un comando específico
exit                                             # Salir del contenedor o terminal

```

---

### **6. Gestionar Volúmenes y Datos (Opcional)**

Docker utiliza volúmenes para persistir datos fuera del ciclo de vida del contenedor:

```bash
docker volume create nombre_volumen          # Crear un volumen
docker run -v nombre_volumen:/ruta contenedor # Montar un volumen en un contenedor
docker volume ls                             # Listar volúmenes
docker volume rm nombre_volumen              # Eliminar un volumen

```

---

### **7. Contexto General de Docker**

- **Contenedores vs. Máquinas Virtuales**:
    - Los contenedores comparten el mismo kernel del sistema operativo, lo que los hace más ligeros y rápidos que las máquinas virtuales.
- **Imágenes**:
    - Son las plantillas base a partir de las cuales se crean los contenedores.
    - Se descargan de repositorios como Docker Hub.
- **Networking**:
    - Docker permite interconectar contenedores usando redes personalizadas.
    - El puerto 80, por ejemplo, se puede mapear al 8080 en el host con `p 8080:80`.
- **Uso de Docker Compose**:
    - Herramienta para definir y ejecutar aplicaciones con múltiples contenedores.
    - Archivo `docker-compose.yml` para definir servicios y redes.

> Ejemplo básico de docker-compose.yml:
> 
> 
> ```yaml
> version: '3.9'
> services:
>   web:
>     image: nginx
>     ports:
>       - "8080:80"
> 
> ```
> 

Docker es una herramienta esencial para simplificar el desarrollo y despliegue de aplicaciones. Los comandos básicos aquí presentados te ayudarán a dominar el flujo de trabajo inicial.