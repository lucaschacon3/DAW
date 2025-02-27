# MVC

### **1. Controladores en Spring Boot**

### **1.1 @RestController vs @Controller**

- `@RestController`: Retorna datos directamente en formato JSON o texto.
- `@Controller`: Sirve para manejar vistas (usado con Thymeleaf).

### **1.2 Ejemplo práctico con `@GetMapping` y `@PostMapping`**

```java
@Controller
public class UserController {

    // GET: Cargar un formulario HTML
    @GetMapping("/")
    public String showForm() {
        return "form"; // Busca form.html en src/main/resources/templates
    }

    // POST: Procesar los datos del formulario
    @PostMapping("/submit")
    public String submitForm(@RequestParam("name") String name,
                             @RequestParam("email") String email,
                             Model model) {
        model.addAttribute("name", name);
        model.addAttribute("email", email);
        return "result"; // Muestra result.html
    }
}

```

---

### **2. Thymeleaf**

### **2.1 Request Parameters (`@RequestParam`)**

```java
@Controller
public class GreetingController {

    @GetMapping("/greet")
    public String greetUser(@RequestParam(name = "name", required = false, defaultValue = "Invitado") String name,
                            Model model) {
        model.addAttribute("name", name); // Se envía "name" al HTML
        return "greeting"; // Busca greeting.html
    }
}

```

**HTML (`greeting.html`)**

```html
<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org">
<head><title>Greeting</title></head>
<body>
    <h1 th:text="'Hola, ' + ${name} + '!'">Hola, Invitado!</h1>
</body>
</html>

```

---

### **2.2 HttpSession**

```java
@Controller
@RequestMapping("/session")
public class SessionController {

    @GetMapping("/save")
    public String saveInSession(HttpSession session) {
        session.setAttribute("user", "Juan Pérez");
        return "sessionSaved"; // Busca sessionSaved.html
    }

    @GetMapping("/get")
    public String getFromSession(HttpSession session, Model model) {
        String user = (String) session.getAttribute("user");
        model.addAttribute("user", user);
        return "sessionData"; // Busca sessionData.html
    }
}

```

**HTML para mostrar datos de sesión (`sessionData.html`)**

```html
<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org">
<head><title>Datos de Sesión</title></head>
<body>
    <h1 th:text="'Usuario en sesión: ' + ${user}">Usuario en sesión: Juan Pérez</h1>
</body>
</html>

```

---

### **2.3 Etiquetas Thymeleaf (importantes para el examen)**

1. **`th:text`**: Mostrar texto dinámico.
2. **`th:href`**: Generar enlaces dinámicos.
3. **`th:action`**: Generar rutas para formularios.
4. **`th:each`**: Iterar sobre listas.
5. **`th:if` y `th:unless`**: Condicionales.

**Ejemplo práctico combinando etiquetas:**

```html
<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org">
<head><title>Ejemplo Thymeleaf</title></head>
<body>
    <h1 th:text="'Bienvenido, ' + ${name} + '!'">Bienvenido, Usuario!</h1>

    <!-- Enlace dinámico -->
    <a th:href="@{/greet(name='Juan')}">Saludar a Juan</a>

    <!-- Tabla de usuarios -->
    <table>
        <thead>
            <tr><th>Nombre</th><th>Email</th></tr>
        </thead>
        <tbody>
            <tr th:each="user : ${users}">
                <td th:text="${user.name}">Nombre</td>
                <td th:text="${user.email}">Email</td>
            </tr>
        </tbody>
    </table>

    <!-- Formulario -->
    <form th:action="@{/submit}" method="post">
        <input type="text" name="name" placeholder="Nombre"/>
        <input type="email" name="email" placeholder="Email"/>
        <button type="submit">Enviar</button>
    </form>
</body>
</html>

```

---

### **3. Validaciones (`@Valid`, `BindingResult`)**

### **3.1 Anotaciones de validación comunes**

1. **`@NotNull`**: El campo no puede ser nulo.
2. **`@Size`**: Restringe el tamaño del texto.
3. **`@Min` y `@Max`**: Restringen valores numéricos.
4. **`@Email`**: Valida un email.

### **3.2 Ejemplo práctico de validaciones**

```java
import jakarta.validation.constraints.*;

public class User {
    @NotNull
    @Size(min = 2, max = 30)
    private String name;

    @NotNull
    @Email
    private String email;

    @Min(18)
    @Max(100)
    private int age;

    // Getters y Setters
}

```

### **3.3 Controlador con validación**

```java
@Controller
@RequestMapping("/users")
public class UserValidationController {

    @GetMapping("/register")
    public String showRegisterForm(Model model) {
        model.addAttribute("user", new User()); // Modelo vacío
        return "register"; // Busca register.html
    }

    @PostMapping("/register")
    public String registerUser(@Valid @ModelAttribute("user") User user,
                               BindingResult result,
                               Model model) {
        if (result.hasErrors()) {
            return "register"; // Si hay errores, vuelve al formulario
        }
        model.addAttribute("message", "Usuario registrado con éxito!");
        return "success"; // Busca success.html
    }
}

```

### **3.4 Formulario con manejo de errores**

**HTML (`register.html`)**

```html
<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org">
<head><title>Registro</title></head>
<body>
    <form th:action="@{/users/register}" method="post" th:object="${user}">
        <label for="name">Nombre:</label>
        <input type="text" id="name" th:field="*{name}" />
        <p th:if="${#fields.hasErrors('name')}" th:errors="*{name}">Error en el nombre</p>

        <label for="email">Email:</label>
        <input type="email" id="email" th:field="*{email}" />
        <p th:if="${#fields.hasErrors('email')}" th:errors="*{email}">Error en el email</p>

        <label for="age">Edad:</label>
        <input type="number" id="age" th:field="*{age}" />
        <p th:if="${#fields.hasErrors('age')}" th:errors="*{age}">Error en la edad</p>

        <button type="submit">Registrar</button>
    </form>
</body>
</html>

```

---

### **4. Tipos de Input en HTML**

1. **Text:** `<input type="text" name="nombre" />`
2. **Password:** `<input type="password" name="clave" />`
3. **Email:** `<input type="email" name="email" />`
4. **Number:** `<input type="number" name="edad" />`
5. **Checkbox:** `<input type="checkbox" name="acepta" />`
6. **Radio:** `<input type="radio" name="genero" value="Hombre" />`
7. **File:** `<input type="file" name="archivo" />`
8. **Textarea:** `<textarea name="comentarios"></textarea>`

---

## Estructura proyecto

```java
mini-quiz-app/
│── src/
│   ├── main/
│   │   ├── java/com/example/mini_quiz/
│   │   │   ├── MiniQuizApplication.java  
│   │   │   ├── MiniQuizController.java  
│   ├── resources/
│   │   ├── application.properties  
│   │   ├── templates/
│   │   │   ├── inicio.html  
│   │   │   ├── etapa2.html  
│   │   │   ├── etapa3.html  
│   │   │   ├── resultado.html  
```

### `MiniQuizApplication.java`

```java
@SpringBootApplication
public class Examenud4Application {

	public static void main(String[] args) {
		SpringApplication.run(Examenud4Application.class, args);
	}

}
```

### `MiniQuizController.java`

Se meten las varibles en la sesion y lo que queremos mostrar en el modelo (errores, variables), para mostrar todo lo añadimos al modelo en la última etapa.

```java
@Controller
public class MiniQuizzController {

    @GetMapping("/")
    public String inicio(Model modelo) {

        return "inicio";
    }

    @PostMapping("/inicio")
    public String procesarInicio(
            @RequestParam(name = "nombre", required = false) String nombre,
            HttpSession sesion,
            Model modelo) {

        // Validación: Verificar que el nombre no esté vacío o nulo
        if (nombre == null || nombre.isBlank()) {
            String error = "El nombre no puede estar vacío";
            modelo.addAttribute("error", error);
            return "inicio"; // Volver a la página de inicio si hay error
        }

        // Guardar el nombre en la sesión
        sesion.setAttribute("nombre", nombre);

        // Redirigir a la siguiente etapa
        return "etapa2";
    }

    @PostMapping("/etapa2")
    public String procesarEtapa2(
            @RequestParam(name = "signo", required = false) String signo,
            HttpSession sesion,
            Model modelo) {

        // Validación: Verificar que se seleccionó un signo
        if (signo == null || signo.isBlank()) {
            modelo.addAttribute("error", "Debes seleccionar un signo.");
            return "etapa2"; // Volver a la página actual en caso de error
        }

        // Guardar el signo en la sesión
        sesion.setAttribute("signo", signo);

        // Redirigir a la siguiente etapa
        return "etapa3";
    }

    @PostMapping("/etapa3")
    public String procesarEtapa3(
            @RequestParam(name = "aficciones", required = false) List<String> aficciones,
            HttpSession sesion,
            Model modelo) {

        // Validación: verificar que al menos una afición fue seleccionada
        if (aficciones == null || aficciones.isEmpty()) {
            modelo.addAttribute("error", "Debes seleccionar al menos una afición.");
            return "etapa3"; // Volver a la vista actual en caso de error
        }

        // Guardar las aficiones en la sesión
        sesion.setAttribute("aficciones", aficciones);

        String nombre = (String) sesion.getAttribute("nombre");
        String signo = (String) sesion.getAttribute("signo");
 
        //String categoria= generaCategoría(nombre,signo,aficiones);

        modelo.addAttribute("nombre", nombre);
        modelo.addAttribute("signo", signo);
        modelo.addAttribute("aficciones", aficciones);

        // Redirigir a la siguiente etapa
        return "resultado";
    }

}
```

### `templates/inicio.html`

```html
<!DOCTYPE HTML>
<html xmlns:th="http://www.thymeleaf.org">
<head>
    <title>MiniQuizz etapa 1</title>
</head>
<body>
    <form th:action="@{/inicio}" method="post">
        <label for="nombre">Nombre:</label>
        <input type="text" id="nombre" name="nombre" th:value="${nombre}" />
        <p th:if="${error}" th:text="${error}" style="color: red;"></p>
        <input type="submit" name="enviar" value="Siguiente" />
    </form>
    
</body>
</html>

```

### `templates/etapa2.html`

```html
<!DOCTYPE HTML>
<html xmlns:th="http://www.thymeleaf.org">
<head>
    <title>MiniQuizz etapa 2</title>
</head>
<body>
    <form method="post" th:action="@{/etapa2}">
        <p>
            <label for="signo">Signo:</label>
            <!-- Añadido el atributo 'name="signo"' -->
            <select id="signo" name="signo">
                <option value="1">Aries</option>
                <option value="2">Tauro</option>
                <option value="3">Géminis</option>
                <option value="4">Cáncer</option>
                <option value="5">Leo</option>
                <option value="6">Virgo</option>
                <option value="7">Libra</option>
                <option value="8">Escorpio</option>
                <option value="9">Sagitario</option>
                <option value="10">Capricornio</option>
                <option value="11">Acuario</option>
                <option value="12">Piscis</option>
            </select>
        </p>

        <input type="submit" name="enviar" value="Siguiente" />
    </form>
</body>
</html>

```

### `templates/etapa3.html`

```
<!DOCTYPE HTML>
<html xmlns:th="http://www.thymeleaf.org">
<head>
    <title>MiniQuizz etapa 3</title>
</head>
<body>
    <form method="post" th:action="@{/etapa3}">
        <p>
            <label>Aficciones:</label>
            <ol>
                <li>
                    <input type="checkbox" id="aficcionDeportes" name="aficciones" value="Deportes" />
                    <label for="aficcionDeportes">Deportes</label>
                </li>
                <li>
                    <input type="checkbox" id="aficcionJuerga" name="aficciones" value="Juerga" />
                    <label for="aficcionJuerga">Juerga</label>
                </li>
                <li>
                    <input type="checkbox" id="aficcionLectura" name="aficciones" value="Lectura" />
                    <label for="aficcionLectura">Lectura</label>
                </li>
                <li>
                    <input type="checkbox" id="aficcionRelaciones" name="aficciones" value="Relaciones_Sociales" />
                    <label for="aficcionRelaciones">Relaciones sociales</label>
                </li>
            </ol>
        </p>

        <!-- Mostrar errores relacionados con las aficciones -->
        <p th:if="${error}" th:text="${error}" style="color: red;"></p>

        <input type="submit" name="enviar" value="Siguiente" />
    </form>
</body>
</html>

```

### `templates/resultado.html`

```html
<!DOCTYPE HTML>
<html xmlns:th="http://www.thymeleaf.org">
<head>
    <title>Resultado del MiniQuizz</title>
</head>
<body>
    <h1>Resultado del MiniQuizz</h1>

    <h3 th:text="|Tu nombre es ${nombre}|"></h3>
    <h3 th:text="|Tu signo es ${signo}|"></h3>

    <h2>Tus aficiones seleccionadas:</h2>
    <ul>
        <li th:each="aficcion : ${aficciones}" th:text="${aficcion}">[Aficción]</li>
    </ul>

    <a href="/">Volver a empezar</a>
</body>
</html>

```