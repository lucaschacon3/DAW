# MongoDB

### COMANDOS

- Entrar al shell.
    
    ```jsx
    mongosh
    ```
    
- Salir del shell.
    
    ```jsx
    exit
    ```
    
- Ayuda de mongo.
    
    ```jsx
    help
    ```
    
- Ayuda de la bd.
    
    ```jsx
    db.help()
    ```
    
- Ayuda de la coleccion.
    
    ```jsx
    db.nombre_de_la_coleccion.help()
    ```
    
- Lista todas las bases de datos en el servidor MongoDB.
    
    ```jsx
    show dbs
    ```
    
- Selecciona una base de datos para usar. Si no existe, se creará cuando insertes un documento
    
    ```jsx
    use nombre_de_la_base_de_datos
    ```
    
- Muestra la base de datos actualmente en uso.
    
    ```jsx
    db
    ```
    
- Lista todas las colecciones en la base de datos actual .
    
    ```jsx
    show collections
    ```
    
- Eliminar la base de datos, primero hay que hacer el use.
    
    ```jsx
    db.dropDatabase()
    ```
    

- Muestra todos los documentos en una colección.
    
    ```jsx
    db.nombre_de_la_coleccion.find().pretty()
    ```
    
- Busca documentos en una colección que cumplan con el filtro.
    
    ```jsx
    db.nombre_de_la_coleccion.find(filtro).pretty()
    ```
    
- Inserta múltiples documentos en una colección.
    
    ```jsx
    db.nombre_de_la_coleccion.insertMany([documentos])
    ```
    
- Inserta un documento.
    
    ```jsx
    db.nombre_de_la_coleccion.insertOne
    ```
    
- Crea una colección y/o inserta un documento
    
    ```jsx
    db.nombre_de_la_coleccion.insertOne(documento)
    ```
    
- Actualiza un documento en una colección.
    
    ```jsx
    db.nombre_de_la_coleccion.updateOne(filtro, actualización)
    ```
    
- Borra un documento de una colección.
    
    ```jsx
    db.nombre_de_la_coleccion.deleteOne(filtro)
    ```
    
- Crea una colección con validación de esquema.
    
    ```jsx
    db.createCollection("nombre", { opciones })
    ```
    
- Borra una colección completa.
    
    ```jsx
    db.nombre_de_la_coleccion.drop()
    ```
    

### ELEMENTOS(MONGODB)→ELEMENTOS(MYSQL)

```
coleccion → tabla
documento → fila
campo → columna/atributo
```

```
COMANDOS                MONGODB                                       MYSQL
Crear DB      	        use nombre_de_la_base_de_datos	              CREATE DATABASE nombre_de_la_base_de_datos
Borrar DB     	        db.dropDatabase()	                            DROP DATABASE nombre_de_la_base_de_datos
Crear Colección	     	  Implícita al insertar documento	              CREATE TABLE nombre_de_la_tabla ...
Borrar Colección     	  db.nombre_de_la_coleccion.drop()	            DROP TABLE nombre_de_la_tabla
Insertar Documento	    db.nombre_de_la_coleccion.insertOne({...})	  INSERT INTO nombre_de_la_tabla ...
Buscar Documentos	      db.nombre_de_la_coleccion.find({...})	        SELECT ... FROM nombre_de_la_tabla ...
Actualizar Documento	  db.nombre_de_la_coleccion.updateOne({...})	  UPDATE nombre_de_la_tabla SET ... WHERE ...
Borrar Documento	      db.nombre_de_la_coleccion.deleteOne({...})	  DELETE FROM nombre_de_la_tabla WHERE ...
```

### EJEMPLO CREAR COLECCION:

```sql
db.createCollection("persona", {
	validator: {
	$jsonSchema: {
		bsonType: "object",
		required: ["DNI", "nombre", "apellido_1"],
		properties: {
			DNI: {
				bsonType: "string",
				description: "Debe ser una cadena y es obligatorio"
			},
			nombre: {
				bsonType: "string",
				description: "Debe ser una cadena y es obligatorio"
			},
			apellido_1: {
				bsonType: "string",
				description: "Debe ser una cadena y es obligatorio"
			},
			apellido_2: {
				bsonType: "string",
				description: "Debe ser una cadena y es opcional"
				}
			}
		}
	}
});
```

### EJEMPLO INSERTAR  (lo que va entre {} es un archivo json)

```sql

db.persona.insertOne({
	DNI: "123456789",
	nombre: "Juan",
	apellido_1: "Pérez",
	apellido_2: "García"
});
```

### EJEMPLO UPDATE:

```sql
db.sucursales.updateOne(
	{ _id: "SUC001" },
	{ $set: { dir: "Nueva Calle 123, Ciudad" } }
)
```

### EJEMPLO DELETE:

```sql
db.sucursales.deleteOne({ _id: "SUC003" })
```