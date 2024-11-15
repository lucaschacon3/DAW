package GUI_TresEnRayaV3;

import java.awt.Color;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JPanel;
import javax.swing.JTextField;

public class TresEnRayaMenu implements ActionListener{
    private JFrame ventana;
    private JPanel panel;

    private JButton atras;
    private JButton jPartida;
    private JButton rPartida;
    private JButton verEstadistica;

    public TresEnRayaMenu(){
        ventana = new JFrame("Menú");

        ventana.setBounds(600, 300, 450, 250);
        ventana.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);

        panel = new JPanel();
        panel.setBackground(new Color(200, 0, 0));
        ventana.add(panel);

        agregaComponentes();

        ventana.setVisible(true);
    }

    private void agregaComponentes() {

        jPartida=new JButton("Jugar Partida");
        jPartida.addActionListener(this);
        panel.add(jPartida);

        rPartida=new JButton("Recrear Partida");
        rPartida.addActionListener(this);
        panel.add(rPartida);

        verEstadistica=new JButton("Ver estadísticas");
        verEstadistica.addActionListener(this);
        panel.add(verEstadistica);

        atras=new JButton("Atrás");
        atras.addActionListener(this);
        panel.add(atras);


    }

    @Override
    public void actionPerformed(ActionEvent e) {
        if (e.getSource()==jPartida) {
            TresEnRayaJvM juego=new TresEnRayaJvM();
            ventana.dispose();
            
        }else if (e.getSource()==rPartida) {
            TresEnRayaRecreoJvM recreoJuego=new TresEnRayaRecreoJvM();
            ventana.dispose();
            
        }
        else if (e.getSource()==verEstadistica) {
            TresEnRayaInicioEstadistica estadistica=new TresEnRayaInicioEstadistica();
            ventana.dispose();
            
        }
        else if (e.getSource()==atras) {
            TresEnRayaInicio inicio = new TresEnRayaInicio();
            ventana.dispose();
            
        }
    }


}
