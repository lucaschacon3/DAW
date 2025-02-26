## **ArrayList**: Array dinámico indexado

- **`add(E elemento)`**: Añadir un elemento al final.
- **`add(int pos, E elemento)`**: Añadir un elemento en una posición específica.
- **`clear()`**: Eliminar todos los elementos.
- **`contains(E elemento)`**: Verificar si el elemento existe.
- **`get(int pos)`**: Obtener un elemento por su índice.
- **`indexOf(E elemento)`**: Obtener la posición de la primera ocurrencia del elemento.
- **`isEmpty()`**: Verificar si está vacío.
- **`lastIndexOf(E elemento)`**: Obtener la posición de la última ocurrencia del elemento.
- **`remove(int pos)`**: Eliminar un elemento por índice.
- **`remove(E elemento)`**: Eliminar la primera ocurrencia de un elemento.
- **`set(int pos, E elemento)`**: Reemplazar un elemento en una posición.
- **`size()`**: Obtener el tamaño del `ArrayList`.

**Ejemplo:**

```java
ArrayList<String> lista = new ArrayList<>();
lista.add("A");
lista.add("B");
lista.add(1, "C"); // Añade "C" en la posición 1

System.out.println(lista.get(1)); // Imprime: C
System.out.println(lista.size()); // Imprime: 3
lista.remove("B"); // Elimina "B"

```

---

## **HashSet**: Conjunto de valores únicos

- **`add(E elemento)`**: Añadir un elemento, no se añaden duplicados.
- **`clear()`**: Eliminar todos los elementos.
- **`contains(E elemento)`**: Verificar si el elemento existe.
- **`isEmpty()`**: Verificar si está vacío.
- **`remove(E elemento)`**: Eliminar un elemento.
- **`size()`**: Obtener el tamaño del `HashSet`.

**Ejemplo:**

```java
HashSet<String> set = new HashSet<>();
set.add("A");
set.add("B");
set.add("A"); // No se añade ya que "A" ya existe

System.out.println(set.size()); // Imprime: 2
set.remove("B");
System.out.println(set.contains("B")); // Imprime: false

```

---

## **HashMap<K, V>**: Mapa de pares clave-valor

- **`containsKey(K clave)`**: Verificar si la clave existe.
- **`get(K clave)`**: Obtener el valor asociado a una clave.
- **`isEmpty()`**: Verificar si está vacío.
- **`keySet()`**: Obtener un `Set` con las claves.
- **`put(K clave, V valor)`**: Añadir un par clave-valor.
- **`remove(K clave)`**: Eliminar un elemento por clave.
- **`size()`**: Obtener el tamaño del `HashMap`.

**Ejemplo:**

```java
HashMap<String, Integer> map = new HashMap<>();
map.put("A", 1);
map.put("B", 2);
map.put("C", 3);

System.out.println(map.get("B")); // Imprime: 2
System.out.println(map.containsKey("C")); // Imprime: true
map.remove("A");

for (String clave : map.keySet()) {
    System.out.println(clave + ": " + map.get(clave));
}
// Imprime:
// B: 2
// C: 3

```

---

## **Recorrer colecciones**

- Para **`ArrayList`** se puede usar tanto `for` como `foreach`:
    
    ```java
    for (int i = 0; i < lista.size(); i++) {
        System.out.println(lista.get(i));
    }
    
    // O utilizando foreach
    for (String item : lista) {
        System.out.println(item);
    }
    
    ```
    
- Para **`HashMap`**, se usa el `keySet()` para recorrer las claves:
    
    ```java
    for (String clave : map.keySet()) {
        System.out.println(clave + ": " + map.get(clave));
    }
    
    ```