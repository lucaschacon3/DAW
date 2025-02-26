## Manejo de Excepciones

- **`try-catch`**: Siempre usarlo para manejar errores al trabajar con bases de datos.
    
    ```java
    try {
        // Código que puede lanzar excepciones
    } catch (SQLException e) {
        System.out.println(e.getMessage());
    }
    
    ```
    

---

## Clases y Métodos Comunes

### 1. **SQLException**

- **`getMessage()`**: Devuelve el mensaje de error de la excepción.
    
    ```java
    catch (SQLException e) {
        System.out.println(e.getMessage());
    }
    
    ```
    

### 2. **Connection**

- **`DriverManager.getConnection()`**: Conecta a la base de datos.
    
    ```java
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/mi_db", "usuario", "contraseña");
    
    ```
    

### 3. **Statement**

- **`createStatement()`**: Crea un `Statement` para ejecutar consultas.
    
    ```java
    Statement stmt = conn.createStatement();
    
    ```
    
- **`executeUpdate()`**: Ejecuta consultas `INSERT`, `UPDATE`, `DELETE`.
    
    ```java
    stmt.executeUpdate("INSERT INTO tabla VALUES (1, 'valor')");
    
    ```
    
- **`executeQuery()`**: Ejecuta consultas `SELECT`.
    
    ```java
    ResultSet rs = stmt.executeQuery("SELECT * FROM tabla");
    
    ```
    

### 4. **PreparedStatement**

- **`prepareStatement()`**: Crea un `PreparedStatement` con parámetros (`?`).
    
    ```java
    PreparedStatement pstmt = conn.prepareStatement("INSERT INTO tabla VALUES (?, ?)");
    pstmt.setInt(1, 1); // Asigna valor al primer parámetro
    pstmt.setString(2, "valor");
    
    ```
    
- **`executeUpdate()`**: Ejecuta consultas con parámetros.
    
    ```java
    pstmt.executeUpdate();
    
    ```
    
- **`setInt()` y `setString()`**: Asignan valores a los parámetros.
    
    ```java
    pstmt.setInt(1, 5);
    pstmt.setString(2, "nombre");
    
    ```
    

### 5. **ResultSet**

- **`next()`**: Avanza a la siguiente fila del `ResultSet`.
    
    ```java
    while (rs.next()) {
        System.out.println(rs.getString("columna1"));
    }
    
    ```
    

---

## Consultas SQL

- **Insertar**:
    
    ```sql
    INSERT INTO tabla (columna1, columna2) VALUES (1, 'valor');
    
    ```
    
- **Actualizar**:
    
    ```sql
    UPDATE tabla SET columna1 = 'nuevo valor' WHERE columna2 = 'condición';
    
    ```
    
- **Eliminar**:
    
    ```sql
    DELETE FROM tabla WHERE columna1 = 1;
    
    ```
    
- **Seleccionar**:
    
    ```sql
    SELECT * FROM tabla WHERE columna1 = 'valor';
    
    ```