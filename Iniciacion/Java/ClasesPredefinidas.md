# Tipos de clases

## 1 - Utilitaria
- Tiene todos los métodos `static`.
- No se pueden construir objetos, por tanto, no existen métodos constructores.
- Los métodos se usan: `Clase.método()`.  

## 2 - No Utilitaria
- Método constructor (el nombre es el mismo que el de la clase).
- Los métodos se usan: `Objeto.método()`.  

# Clase Scanner - No Utilitaria
Esta clase nos permite obtener la entrada de datos primitivos.

## 1 - Constructor:
- `Scanner(System.in)`  

## 2 - Métodos:
- `public int nextInt()` → método que permite leer un número entero.
- `public double nextDouble()` → método que permite leer un número decimal.
- `public String nextLine()` → método que permite leer una cadena de caracteres.
- `public char nextLine().charAt(0)` → método que permite leer un carácter.
- `public boolean hasNextInt()` → método que devuelve si el número introducido es entero o no.
- `public boolean hasNextDouble()` → método que devuelve si el número introducido es decimal.

# Clase String - No Utilitaria
Esta clase sirve para manejar cadenas de caracteres.

## 1 - Constructores:
- `public String()` → inicializa una cadena de caracteres vacía.
- `public String(char[] value)` → función que pasa un array de caracteres y devuelve un `String`.

## 2 - Métodos:
- `public char charAt(int index)` → busca un carácter en concreto dentro de una cadena.
- `public int length()` → devuelve un entero con la longitud de la cadena de caracteres.
- `public String toUpperCase()` → convierte toda la cadena en mayúsculas.
- `public String toLowerCase()` → convierte toda la cadena en minúsculas.
- `public boolean equals(String cadena2)` → compara dos cadenas y devuelve el resultado.
- `public boolean equalsIgnoreCase(String cadena2)` → compara dos cadenas ignorando mayúsculas y minúsculas.
- `public int indexOf(char carácter o String subcadena)` → devuelve la primera posición del carácter.
- `public int lastIndexOf(char carácter o String subcadena)` → devuelve la última posición del carácter.
- `public String substring(int desde_incluido, int hasta_no_incluido)` → devuelve una subcadena.
- `public String replace(char oldChar, char newChar)` → reemplaza un carácter por otro.
- `public String[] split(String separador)` → devuelve un array de `String` eliminando el separador.
- `public boolean contains(String)` → devuelve `true` si la subcadena está presente en la cadena original.

# Clase Math - Utilitaria
Genera números.

## 1 - Métodos:
- `static int abs(int a)` → devuelve el valor absoluto de un número.
- `static int ceil(double a)` → redondea un número decimal al alza.
- `static int floor(double a)` → redondea un número decimal a la baja.
- `static int round(float a)` → redondea según la norma matemática.
- `static int max(int a, int b)` → devuelve el valor máximo entre dos valores.
- `static int min(int a, int b)` → devuelve el valor mínimo entre dos valores.
- `static double pow(double base, double exponente)` → eleva la base al exponente.
- `static double sqrt(double num)` → calcula la raíz cuadrada de un número.
- `static double random()` → devuelve un número aleatorio entre `0.0` y `1.0`.
- `static double PI` → devuelve el número π.
- `static double E` → devuelve el número e.

# Clase Random - No Utilitaria
Genera un número aleatorio.

## 1 - Constructor:
- `Random()`  

## 2 - Métodos:
- `public int nextInt(int bound)` → devuelve un número entero entre `[0, bound)`.

# Clases Wrappers - Utilitaria
Encapsulan un tipo de dato primitivo. Todas las clases son utilitarias.

## Métodos:

### 1 - Clase Integer:
- `Integer.MAX_VALUE` → máximo número representable.
- `Integer.MIN_VALUE` → mínimo número representable.
- `static int Integer.parseInt(String s)` → transforma un `String` en un `int`.

### 2 – Clase Double:
- `Double.MAX_VALUE` → máximo número `double` representable.
- `Double.MIN_VALUE` → mínimo número `double` representable.
- `static double Double.parseDouble(String s)` → transforma un `String` en un `double`.

### 3 – Clase Boolean:
- `static boolean isNaN(double v)` → comprueba si NO es un número.
- `static boolean isInfinite(double v)` → comprueba si el resultado de una operación es infinito.
