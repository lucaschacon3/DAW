# Estructura de proyecto

```
api-rest-libros/
│── src/
│   ├── main/
│   │   ├── java/com/example/api_rest/
│   │   │   ├── ApiRestApplication.java  
│   │   │   ├── controllers/
│   │   │   │   ├── LibroController.java  
│   │   │   ├── entities/
│   │   │   │   ├── Libro.java            
│   │   │   ├── repositories/
│   │   │   │   ├── LibroRepository.java  
│   │   │   ├── services/
│   │   │   │   ├── LibroService.java     
│   ├── resources/
│   │   ├── application.properties  
│   │   ├── import.sql  
```

### `import.sql`

```sql
-- Crear la tabla si no existe
CREATE TABLE IF NOT EXISTS libros (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(255) NOT NULL,
    autor VARCHAR(255) NOT NULL,
    año INT NOT NULL
);
-- Insertar datos en la tabla libros
INSERT INTO libro (titulo, autor, año) VALUES 
('Cien años de soledad', 'Gabriel García Márquez', 1967),
('Don Quijote de la Mancha', 'Miguel de Cervantes', 1605),
('1984', 'George Orwell', 1949),
('El principito', 'Antoine de Saint-Exupéry', 1943),
('Crónica de una muerte anunciada', 'Gabriel García Márquez', 1981),
('Rayuela', 'Julio Cortázar', 1963),
('Fahrenheit 451', 'Ray Bradbury', 1953),
('Moby-Dick', 'Herman Melville', 1851),
('Orgullo y prejuicio', 'Jane Austen', 1813),
('El gran Gatsby', 'F. Scott Fitzgerald', 1925);
```

### `application.properties`

**MySQL**

```java
spring.datasource.url=jdbc:mysql://localhost:3306/dwes1
spring.datasource.username=daw2
spring.datasource.password=LaElipa
spring.jpa.hibernate.ddl-auto=update //crea las tablas al iniciar programa
spring.jpa.database-platform=org.hibernate.dialect.MySQLDialect
spring.sql.init.mode=always # Ejecuta el script data.sql en cada inicio /resurces
```

- Para acceder:

```bash
mysql dwes1 -u daw2 -pLaElipa
```

**H2**

```java
# Configuración de H2 en memoria
spring.datasource.url=jdbc:h2:mem:testdb
spring.datasource.driverClassName=org.h2.Driver
spring.datasource.username=sa
spring.datasource.password=
spring.jpa.database-platform=org.hibernate.dialect.H2Dialect

# Habilitar la consola H2
spring.h2.console.enabled=true
spring.h2.console.path=/h2-console

# Para asegurarte de que data.sql se ejecuta siempre
spring.sql.init.mode=always
spring.jpa.hibernate.ddl-auto=create-drop
```

- Para acceder

```java
http://localhost:8080/h2-console

JDBC URL: jdbc:h2:mem:testdb
User: sa
Password: (Dejar vacío si no configuraste una)
```

### `ApiRestApplication.java`

```java
@SpringBootApplication
public class ApiRestApplication {

	public static void main(String[] args) {
		SpringApplication.run(ApiRestApplication.class, args);
	}
}
```

### `Entities/Libro.java`

```java
@Entity
public class Libro {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column
    private String titulo;

    @Column
    private String autor;

    @Column
    private int año;
    
    // Getters, setters y constructor (vacio y con atributos menos id)
    
     @Override
    public boolean equals(Object o) {
        if (this == o)
            return true;
        if (o == null || getClass() != o.getClass())
            return false;
        Libro libro = (Libro) o;
        return Objects.equals(titulo, libro.titulo) && Objects.equals(autor, libro.autor);
    }

    @Override
    public int hashCode() {
        return Objects.hash(titulo, autor);
    }
```

### `Repositories/LibroRepository.java`

```java
@Repository
public interface LibroRepository extends JpaRepository<Libro, Long> {
    Optional<Libro> findByTitulo(String titulo);
}
```

### `Services/LibroService.java`

```java
@Service
public class LibroService {

    @Autowired
    private LibroRepository libroRepository;

    public List<Libro> getAllUsers() {
        return libroRepository.findAll();
    }

    public Libro saveLibro(Libro libro) {
        return libroRepository.save(libro);
    }

    public Optional<Libro> getById(Long id) {
        return libroRepository.findById(id);
    }

    public Libro updateById(Libro request, Long id) {
        Libro libro = libroRepository.findById(id).orElseThrow(() -> new RuntimeException("Libro no encontrado"));
        libro.setTitulo(request.getTitulo());
        libro.setAutor(request.getAutor());
        libro.setAño(request.getAño());
        return libroRepository.save(libro);
    }

    public Libro partialUpdateById(Long id, Map<String, Object> updates) {
        Libro libro = libroRepository.findById(id).orElseThrow(() -> new RuntimeException("Libro no encontrado"));

        if (updates.containsKey("titulo")) {
            libro.setTitulo((String) updates.get("titulo"));
        }
        if (updates.containsKey("autor")) {
            libro.setAutor((String) updates.get("autor"));
        }
        if (updates.containsKey("año")) {
            libro.setAño((Integer) updates.get("año"));
        }

        return libroRepository.save(libro);
    }

    public void deleteLibro(Long id) {
        libroRepository.deleteById(id);
    }

    public boolean existsById(Long id) {
        return libroRepository.existsById(id);
    }

    public boolean existsByTitulo(String titulo) {
        return libroRepository.findByTitulo(titulo).isPresent();
    }

    
}
```

### `Controllers/LibroController.java`

```java
@RestController
@RequestMapping("/libros")
public class LibroController {

    @Autowired
    private LibroService libroService;

    @GetMapping
    public ResponseEntity<List<Libro>> getAllLibros() {
        return ResponseEntity.status(HttpStatus.OK).body(libroService.getAllUsers());
    }

    @GetMapping(path = "/{id}")
    public ResponseEntity<?> getLibroById(@PathVariable(name="id") Long id) {
        if (libroService.existsById(id)) {
            return ResponseEntity.status(HttpStatus.OK).body(libroService.getById(id));
        }
        return ResponseEntity.status(HttpStatus.NOT_FOUND).body("No encontrado");
    }

    @PostMapping
    public ResponseEntity<?> saveLibro(@RequestBody Libro libro) {
        if (libroService.existsByTitulo(libro.getTitulo())) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("El libro ya existe.");
        }
        return ResponseEntity.status(HttpStatus.CREATED).body(libroService.saveLibro(libro));
    }

    @DeleteMapping(path = "/{id}")
    public ResponseEntity<?> deleteById(@PathVariable (name="id") Long id) {
        if (!libroService.existsById(id)) {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body("No encontrado");
        }
        libroService.deleteLibro(id);
        return ResponseEntity.status(HttpStatus.NO_CONTENT).build();
    }

    @PutMapping(path = "/{id}")
    public ResponseEntity<?> updateLibroById(@PathVariable (name="id") Long id, @RequestBody Libro libro) {
        if (!libroService.existsById(id)) {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body("No encontrado");
        }
        return ResponseEntity.status(HttpStatus.OK).body(libroService.updateById(libro, id));
    }

    @PatchMapping(path = "/{id}")
    public ResponseEntity<?> partialUpdateLibro(@PathVariable (name="id") Long id, @RequestBody Map<String, Object> updates) {
        if (!libroService.existsById(id)) {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body("No encontrado");
        }
        return ResponseEntity.status(HttpStatus.OK).body(libroService.partialUpdateById(id, updates));
    }

}
```