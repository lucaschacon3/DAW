## Componentes GUI (Swing)

### **JFrame**

- **`JFrame`**: Clase principal para crear una ventana. Se extiende de `JFrame` para personalizarla.
    
    ```java
    public class MiVentana extends JFrame {
        public MiVentana() {
            super("Título de la ventana");
            setBounds(100, 100, 300, 200); // Tamaño y ubicación de la ventana
            setDefaultCloseOperation(EXIT_ON_CLOSE); // Cerrar la ventana
            setVisible(true); // Hacerla visible
        }
    }
    
    ```
    

### **JPanel**

- **`JPanel`**: Contenedor para otros componentes (como botones, etiquetas).
    
    ```java
    JPanel panel = new JPanel();
    panel.add(new JLabel("Texto en el panel"));
    panel.setVisible(true);
    
    ```
    

### **JLabel**

- **`JLabel`**: Etiqueta de texto.
    - **`JLabel()`**: Constructor por defecto.
    - **`JLabel(String texto)`**: Constructor con texto.
    - **`setText(String texto)`**: Modificar el texto de la etiqueta.
    - **`getText()`**: Obtener el texto actual.
    
    ```java
    JLabel label = new JLabel("Texto inicial");
    label.setText("Texto modificado");
    System.out.println(label.getText()); // Imprime: Texto modificado
    
    ```
    

### **JTextField**

- **`JTextField`**: Campo de texto.
    - **`JTextField(int columnas)`**: Constructor con número de columnas.
    - **`setText(String texto)`**: Modificar el texto en el campo.
    - **`getText()`**: Obtener el texto del campo.
    
    ```java
    JTextField textField = new JTextField(20);
    textField.setText("Texto en el campo");
    System.out.println(textField.getText()); // Imprime: Texto en el campo
    
    ```
    

### **JButton**

- **`JButton`**: Botón de la interfaz.
    - **`JButton(String texto)`**: Constructor con texto en el botón.
    - **`setText(String texto)`**: Modificar el texto del botón.
    - **`getText()`**: Obtener el texto del botón.
    - **`addActionListener(this)`**: Asocia un evento al botón (el `this` se refiere a la clase que implementa el evento).
    - **`setEnabled(boolean booleano)`**: Habilitar o deshabilitar el botón.
    
    ```java
    JButton boton = new JButton("Hacer algo");
    boton.addActionListener(this); // Asocia el evento
    boton.setEnabled(true); // Habilita el botón
    
    ```
    

### **ActionListener**

- **`ActionListener`**: Interfaz para manejar eventos de acción.
    - **`actionPerformed(ActionEvent e)`**: Método que se ejecuta cuando se hace clic en el botón.
    - **`e.getSource()`**: Obtiene el objeto que desencadenó el evento.
    
    ```java
    public class MiVentana extends JFrame implements ActionListener {
        private JButton boton;
    
        public MiVentana() {
            boton = new JButton("Haz clic");
            boton.addActionListener(this);
            add(boton);
        }
    
        @Override
        public void actionPerformed(ActionEvent e) {
            JButton source = (JButton) e.getSource(); // Obtiene el botón que desencadenó el evento
            System.out.println("Botón presionado: " + source.getText());
        }
    }
    
    ```
    

---

## Manejo de Ventanas

### **Ventanas Múltiples**

Cuando hay varias ventanas, instáncialas en el `main` y maneja la referencia a cada una en su clase respectiva.

```java
public class Ventana1 extends JFrame {
    private Ventana2 ventana2;

    public Ventana1() {
        ventana2 = new Ventana2();
        setTitle("Ventana 1");
        setBounds(100, 100, 300, 200);
        setDefaultCloseOperation(EXIT_ON_CLOSE);
        setVisible(true);
    }

    public void setVentana2(Ventana2 ventana2) {
        this.ventana2 = ventana2;
    }
}

public class Ventana2 extends JFrame {
    public Ventana2() {
        setTitle("Ventana 2");
        setBounds(200, 200, 300, 200);
        setDefaultCloseOperation(EXIT_ON_CLOSE);
        setVisible(true);
    }
}

public class Main {
    public static void main(String[] args) {
        Ventana1 v1 = new Ventana1();
        Ventana2 v2 = new Ventana2();
        v1.setVentana2(v2);  // Pasa la referencia de Ventana2 a Ventana1
    }
}

```