package GUI_DosVentanas;


import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JPanel;


public class Ventana2 implements ActionListener {
    private JFrame ventana2;
    private JPanel panel;
    private JButton boton1;
    
    public Ventana2() {

        ventana2= new JFrame("mi ventana");

        //ventana.setBounds(localizacionX, localizacionY, tamañoX, tamañoY);
        ventana2.setBounds(600, 300, 300, 300);

        //hacemos que se pueda cerrar la ventana
        ventana2.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);

        //creamos la lamina y la añadimos al marco
        panel=new JPanel();
        ventana2.add(panel);

        //agregamos los componentes
        agregaComponentes();

        // hacemos visible la ventana
        ventana2.setVisible(true);

    }

    private void agregaComponentes() {

        boton1= new JButton("Volver");
        boton1.addActionListener(this);
        panel.add(boton1);

    }

    @Override
    public void actionPerformed(ActionEvent e) {

        if (e.getSource()==boton1) {
            Ventana1 ventana1=new Ventana1();
            ventana2.dispose();
        }

    }

}

