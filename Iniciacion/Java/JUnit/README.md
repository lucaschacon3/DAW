# JUnit

### **Pruebas unitarias**

Las pruebas unitarias se usan para verificar el comportamiento correcto de métodos individuales en una clase. En este caso, probamos los métodos de una clase `Calculadora`.

```java
import static org.junit.Assert.assertTrue;
import org.junit.Test;

public class CalculadoraTest {

    // Prueba: 1 + 3 debería ser 4
    @Test
    public void unoMasTresDeberiaSerCuatro() {
        Calculadora calculadora = new Calculadora();
        assertTrue(calculadora.suma(1, 3) == 4);  // Verifica que el resultado sea 4
    }

    // Prueba: 3 - 3 debería ser 0
    @Test
    public void tresMenosTresDeberiaSerCero() {
        Calculadora calculadora = new Calculadora();
        assertTrue(calculadora.resta(3, 3) == 0);  // Verifica que el resultado sea 0
    }

    // Prueba: 3 * 3 debería ser 9
    @Test
    public void tresPorTresDeberiaSerNueve() {
        Calculadora calculadora = new Calculadora();
        assertTrue(calculadora.multiplicacion(3, 3) == 9);  // Verifica que el resultado sea 9
    }

    // Prueba: 20 / 5 debería ser 4
    @Test
    public void veinteEntreCincoDeberiaSerCuatro() {
        Calculadora calculadora = new Calculadora();
        assertTrue(calculadora.division(20, 5) == 4);  // Verifica que el resultado sea 4
    }

    // Prueba: 20 / 0 debería devolver un error o null (prevención de división por cero)
    @Test
    public void veinteEntreCeroDeberiaSerMenosUno() {
        Calculadora calculadora = new Calculadora();
        assertTrue(calculadora.division(20, 0) == null);  // Verifica que la división entre 0 devuelva null
    }
}

```

---

### **Explicación de los elementos del código:**

- **`@Test`**: Indica que el método es una prueba unitaria.
- **`assertTrue(condición)`**: Asegura que la condición sea verdadera. Si no es así, la prueba falla.
- **Métodos de prueba**:
    - **`unoMasTresDeberiaSerCuatro()`**: Verifica que la suma de 1 + 3 dé como resultado 4.
    - **`tresMenosTresDeberiaSerCero()`**: Verifica que 3 - 3 sea igual a 0.
    - **`tresPorTresDeberiaSerNueve()`**: Verifica que la multiplicación de 3 * 3 dé 9.
    - **`veinteEntreCincoDeberiaSerCuatro()`**: Verifica que la división de 20 entre 5 sea igual a 4.
    - **`veinteEntreCeroDeberiaSerMenosUno()`**: Verifica que al intentar dividir entre 0, se maneje correctamente la excepción o se retorne `null`.

---

### **Puntos importantes:**

1. **Instanciación de la clase bajo prueba**: Cada prueba crea un objeto de la clase `Calculadora` para usar los métodos que se desean probar.
2. **Comprobación de resultados esperados**: Se comparan los resultados obtenidos con los resultados esperados utilizando el método `assertTrue()`.
3. **Manejo de excepciones**: Es importante que las pruebas manejen escenarios como la división por cero, para prevenir errores en la ejecución del programa.