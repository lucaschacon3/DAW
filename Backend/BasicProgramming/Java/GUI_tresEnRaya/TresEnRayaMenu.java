package GUI_tresEnRaya;

import java.awt.Color;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JPanel;

public class TresEnRayaMenu implements ActionListener{
    private JFrame ventana;
    private JPanel panel;

    private JButton jvj;
    private JButton jvm;

    public TresEnRayaMenu(){
        ventana = new JFrame("Menú");

        ventana.setBounds(600, 300, 250, 250);
        ventana.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);

        panel = new JPanel();
        panel.setBackground(new Color(200, 0, 0));
        ventana.add(panel);

        agregaComponentes();

        ventana.setVisible(true);
    }

    private void agregaComponentes() {
        jvj=new JButton("Jugador vs Jugador");
        jvj.addActionListener(this);
        panel.add(jvj);

        jvm=new JButton("Jugador vs Maquina");
        jvm.addActionListener(this);
        panel.add(jvm);
    }

    @Override
    public void actionPerformed(ActionEvent e) {
        if (e.getSource()==jvj) {
            TresEnRayaJvJ juegoEnRayaJvJ=new TresEnRayaJvJ();
            ventana.dispose();
            
        }else if (e.getSource()==jvm) {
            TresEnRayaJvM juegoEnRayaJvM=new TresEnRayaJvM();
            ventana.dispose();
            
        }
    }


}
