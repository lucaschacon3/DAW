package GUI_tienda;

import java.awt.Color;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JTextArea;
import javax.swing.JTextField;

public class Tienda_ventana implements ActionListener {
    
    private JFrame ventana;
    private JPanel panel;

    private JButton anadir;
    private JButton mostrar;
    private JButton hacer;

    private JLabel cod_producto_label;
    private JTextField cod_producto_text;

    private JLabel unidades_label;
    private JTextField unidades_text;

    private JLabel carrito_label;
    private JLabel carrito_completo_text;
   
    private JLabel info;
    private String pedido="";

    
    public Tienda_ventana(){

        ventana = new JFrame("TIENDA");
        ventana.setBounds(600, 300, 320, 400);
        ventana.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);

        panel = new JPanel();
        ventana.add(panel);

        agregaComponentes();

        ventana.setVisible(true);
    }

    private void agregaComponentes() {
        
        cod_producto_label = new JLabel("Código de producto: ");
        panel.add(cod_producto_label);
        cod_producto_text=new JTextField(10);
        panel.add(cod_producto_text);

        unidades_label = new JLabel("Unidades");
        panel.add(unidades_label);
        unidades_text=new JTextField(10);
        panel.add(unidades_text);

        anadir=new JButton("Añadir al carrito");
        anadir.addActionListener(this);
        panel.add(anadir);

        mostrar=new JButton("Mostrar carrito");
        mostrar.addActionListener(this);
        panel.add(mostrar);

        carrito_label = new JLabel("Carrito:                                      ");
        carrito_label.setBackground(new Color(100, 3, 2));
        panel.add(carrito_label);
        carrito_completo_text=new JLabel("");
       
        panel.add(carrito_completo_text);

        hacer=new JButton("Hacer pedido");
        hacer.addActionListener(this);
        panel.add(hacer);


        info = new JLabel(" ");
        panel.add(info);

    }

    @Override
    public void actionPerformed(ActionEvent e) {

        if (e.getSource()==hacer) {
            info.setText("Pedido realizado correctamente");
            cod_producto_text.setText("");
            unidades_text.setText("");
            carrito_completo_text.setText("");
            
        }else if (e.getSource()==mostrar) {
            carrito_completo_text.setText(pedido);
        }else if (e.getSource()==anadir) {
            pedido = carrito_completo_text.getText()+" Código: "+cod_producto_text.getText()+" Unidades: "+unidades_text.getText() ;
            info.setText("Producto añadido");
        }
    }

    public static void main(String[] args) {
        Tienda_ventana tienda=new Tienda_ventana();
    }
}

