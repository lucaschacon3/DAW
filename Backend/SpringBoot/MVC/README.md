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