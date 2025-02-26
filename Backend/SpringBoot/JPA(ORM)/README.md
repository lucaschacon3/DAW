`resources/aplication.properties` 

```java
spring.application.name=quiz_bbdd_1n

spring.datasource.url=jdbc:mysql://localhost:3306/dwes1
spring.datasource.username=daw2
spring.datasource.password=LaElipa
spring.datasource.driver-class-name=com.mysql.cj.jdbc.Driver
spring.jpa.hibernate.ddl-auto=update  
spring.jpa.show-sql=true               
spring.jpa.database-platform=org.hibernate.dialect.MySQLDialect

```

Para acceder:

```bash
mysql dwes1 -u daw2 -pLaElipa
```

### Anotaciones

### 1. **@Entity**

Marca una clase como una entidad JPA, lo que significa que es mapeada a una tabla en la base de datos.

```java
@Entity
public class Pregunta {
    @Id
    private Long id;

    private String texto;
}

```

### 2. **@Id**

Define el identificador único de la entidad. Usualmente se usa en un campo que corresponde a una clave primaria en la base de datos.

```java
@Id
@GeneratedValue(strategy = GenerationType.IDENTITY)
private Long id;

```

### 3. **@GeneratedValue**

Especifica la estrategia para la generación automática de valores para la clave primaria. Las estrategias comunes incluyen `AUTO`, `IDENTITY`, `SEQUENCE` y `TABLE`.

```java
@GeneratedValue(strategy = GenerationType.IDENTITY)
private Long id;

```

### 4. **@Column**

Especifica las propiedades de una columna en la base de datos, como su nombre, tipo y si es nullable o no. Es útil cuando el nombre de la columna en la base de datos no coincide con el nombre del atributo en la clase.

```java
@Column(name = "texto_pregunta", nullable = false)
private String texto;

```

### 5. **@Table**

Define la tabla en la base de datos a la que se mapea la entidad. Esto es útil si deseas especificar un nombre de tabla diferente o configurar características como los índices.

```java
@Table(name = "preguntas")
@Entity
public class Pregunta {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String texto;
}

```

### 6. **@OneToMany**

Indica una relación de uno a muchos, donde una entidad está relacionada con muchas instancias de otra entidad.

```java
@OneToMany(mappedBy = "pregunta")
private List<Respuesta> respuestas;

```

### 7. **@ManyToOne**

Especifica una relación de muchos a uno, donde muchas entidades están relacionadas con una única entidad de otro tipo.

```java
@ManyToOne
@JoinColumn(name = "pregunta_id", nullable = false)
private Pregunta pregunta;

```

### 8. **@ManyToMany**

Define una relación de muchos a muchos entre dos entidades. Se utiliza cuando ambas entidades pueden tener varias instancias relacionadas entre sí.

```java
@ManyToMany
@JoinTable(
  name = "quiz_respuestas",
  joinColumns = @JoinColumn(name = "pregunta_id"),
  inverseJoinColumns = @JoinColumn(name = "respuesta_id")
)
private List<Respuesta> respuestas;

```

### 9. **@JoinColumn**

Se usa para especificar la columna de la clave foránea en una relación entre entidades. Es comúnmente utilizado con `@ManyToOne` o `@OneToMany`.

```java
@JoinColumn(name = "pregunta_id", nullable = false)
private Pregunta pregunta;

```

### 10. **@Query**

Anotación que se usa para crear consultas personalizadas en un repositorio, generalmente con Spring Data JPA.

```java
@Query("SELECT p FROM Pregunta p WHERE p.texto LIKE %:texto%")
List<Pregunta> findByTextoContaining(@Param("texto") String texto);

```