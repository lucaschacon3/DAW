package GUI_ventana;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JTextField;

public class Ventana implements ActionListener {
    private JFrame ventana;
    private JPanel panel;

    private JLabel etiqueta;
    private JTextField cajaTexto;
    private JButton boton;
    
    public Ventana() {

        ventana= new JFrame("mi ventana");

        //ventana.setBounds(localizacionX, localizacionY, tamañoX, tamañoY);
        ventana.setBounds(0, 0, 700, 700);

        //hacemos que se pueda cerrar la ventana
        ventana.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);

        //creamos la lamina y la añadimos al marco
        panel=new JPanel();
        ventana.add(panel);

        //agregamos los componentes
        agregaComponentes();

        // hacemos visible la ventana
        ventana.setVisible(true);

    }

    private void agregaComponentes() {

        cajaTexto= new JTextField(10);//tamaño de 10px
        panel.add(cajaTexto);

        boton= new JButton("enviar");
        boton.addActionListener(this);
        panel.add(boton);

        etiqueta = new JLabel("texto a cambiar");
        panel.add(etiqueta);
    }

    @Override
    public void actionPerformed(ActionEvent e) {

		// respuesta al evento del click de ratón
		String saludoString="Hola "+cajaTexto.getText();
		etiqueta.setText(saludoString);
    
    }

    

    
}
