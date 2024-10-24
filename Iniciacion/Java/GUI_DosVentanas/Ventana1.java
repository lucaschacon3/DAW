package GUI_DosVentanas;


import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JPanel;


public class Ventana1 implements ActionListener {
    private JFrame ventana1;
    private JPanel panel;
    private JButton boton1;
    
    public Ventana1() {

        ventana1= new JFrame("mi ventana");

        //ventana.setBounds(localizacionX, localizacionY, tamañoX, tamañoY);
        ventana1.setBounds(600, 300, 300, 300);

        //hacemos que se pueda cerrar la ventana
        ventana1.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);

        //creamos la lamina y la añadimos al marco
        panel=new JPanel();
        ventana1.add(panel);

        //agregamos los componentes
        agregaComponentes();

        // hacemos visible la ventana
        ventana1.setVisible(true);

    }

    private void agregaComponentes() {

        boton1= new JButton("IR");
        boton1.addActionListener(this);
        panel.add(boton1);

    }

    @Override
    public void actionPerformed(ActionEvent e) {

        if (e.getSource()==boton1) {
            Ventana2 ventana2=new Ventana2();
            ventana1.dispose();
        }

    }

}

