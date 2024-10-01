package GUI_TresEnRayaV3;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;

import java.awt.Color;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.Random;

public class TresEnRayaRecreoJvM implements ActionListener {
    private JFrame ventana;
    private JPanel panel;

    private JLabel informacionLabel;

    private JButton[] botones;
    private JButton reiniciar;
    private JButton atras;

    private int turno;

    public TresEnRayaRecreoJvM() {
        this.turno = 0;
        ventana = new JFrame("3 en raya");

        ventana.setBounds(600, 300, 160, 210);
        ventana.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);

        panel = new JPanel();
        panel.setBackground(new Color(200, 0, 0));
        ventana.add(panel);

        agregaComponentes();

        ventana.setVisible(true);
    }

    public void agregaComponentes() {
        botones = new JButton[9];
        for (int i = 0; i < 9; i++) {
            botones[i] = new JButton("-");
            botones[i].setEnabled(false);
            panel.add(botones[i]);
        }

        botones[0].setText("X");
        botones[1].setText("O");
        botones[2].setText("O");
        botones[3].setText("O");
        botones[4].setText("X");
        botones[5].setText("X");
        botones[6].setText("X");
        botones[7].setText("O");
        botones[8].setText("X");

        atras = new JButton("Atras");
        atras.addActionListener(this);
        panel.add(atras);

        informacionLabel = new JLabel("Ha ganado jugador 1");
        panel.add(informacionLabel);
    }

    @Override
    public void actionPerformed(ActionEvent e) {

        FuncionAtras(e);
    }

    private void FuncionAtras(ActionEvent e) {
        if (e.getSource()==atras) {
            TresEnRayaInicio menu =new TresEnRayaInicio();
            ventana.dispose();
        }
    }



}


    

