package GUI_tresEnRaya;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;

import java.awt.Color;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

public class TresEnRayaJvJ implements ActionListener {
    private JFrame ventana;
    private JPanel panel;

    private JLabel informacionLabel;

    private JButton[] botones;
    private JButton reiniciar;
    private JButton atras;

    private int turno;

    public TresEnRayaJvJ() {
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
            botones[i].addActionListener(this);
            panel.add(botones[i]);
        }

        reiniciar = new JButton("Reiniciar");
        reiniciar.addActionListener(this);
        panel.add(reiniciar);

        atras = new JButton("Atras");
        atras.addActionListener(this);
        panel.add(atras);

        informacionLabel = new JLabel("Informacion 3 en raya");
        panel.add(informacionLabel);
    }

    @Override
    public void actionPerformed(ActionEvent e) {
        for (int i = 0; i < 9; i++) {
            if (e.getSource() == botones[i]) {
                if (turno % 2 == 0) {
                    botones[i].setText("X");
                    botones[i].setEnabled(false);
                } else {
                    botones[i].setText("O");
                    botones[i].setEnabled(false);
                }
                turno++;
            }
        }

        ReiniciarPartida(e);
        FuncionAtras(e);
        Ganador();
    }

    private void Ganador() {
        if (ganaJ1()) {
            informacionLabel.setText("Ha ganado J1");
            for (int i = 0; i < botones.length; i++) {
                botones[i].setEnabled(false);
            }
        } else if (ganaJ2()) {
            informacionLabel.setText("Ha ganado J2");
            for (int i = 0; i < botones.length; i++) {
                botones[i].setEnabled(false);
            }
        } else if (!ganaJ1()&&!ganaJ2()&&turno==9){
            informacionLabel.setText("Empate");
        }
    }

    private void FuncionAtras(ActionEvent e) {
        if (e.getSource()==atras) {
            TresEnRayaMenu menu =new TresEnRayaMenu();
            ventana.dispose();
        }
    }

    private void ReiniciarPartida(ActionEvent e) {
        if (e.getSource() == reiniciar) {
            for (int i = 0; i < 9; i++) {
                botones[i].setText("-");
                botones[i].setEnabled(true);
            }
            informacionLabel.setText("Informacion 3 en raya");
            turno = 0;
        }
    }

    public boolean ganaJ1(){
        if (botones[0].getText().equals("X") && botones[1].getText().equals("X") && botones[2].getText().equals("X")) {
            return true;
        } else if (botones[3].getText().equals("X") && botones[4].getText().equals("X") && botones[5].getText().equals("X")) {
            return true;
        } else if (botones[6].getText().equals("X") && botones[7].getText().equals("X") && botones[8].getText().equals("X")) {
            return true;
        } else if (botones[0].getText().equals("X") && botones[3].getText().equals("X") && botones[6].getText().equals("X")) {
            return true;
        } else if (botones[1].getText().equals("X") && botones[4].getText().equals("X") && botones[7].getText().equals("X")) {
            return true;
        } else if (botones[2].getText().equals("X") && botones[5].getText().equals("X") && botones[8].getText().equals("X")) {
            return true;
        } else if (botones[0].getText().equals("X") && botones[4].getText().equals("X") && botones[8].getText().equals("X")) {
            return true;
        } else if (botones[2].getText().equals("X") && botones[4].getText().equals("X") && botones[6].getText().equals("X")) {
            return true;
        }
        return false;  
    }
    
    public boolean ganaJ2(){
        if (botones[0].getText().equals("O") && botones[1].getText().equals("O") && botones[2].getText().equals("O")) {
            return true;
        } else if (botones[3].getText().equals("O") && botones[4].getText().equals("O") && botones[5].getText().equals("O")) {
            return true;
        } else if (botones[6].getText().equals("O") && botones[7].getText().equals("O") && botones[8].getText().equals("O")) {
            return true;
        } else if (botones[0].getText().equals("O") && botones[3].getText().equals("O") && botones[6].getText().equals("O")) {
            return true;
        } else if (botones[1].getText().equals("O") && botones[4].getText().equals("O") && botones[7].getText().equals("O")) {
            return true;
        } else if (botones[2].getText().equals("O") && botones[5].getText().equals("O") && botones[8].getText().equals("O")) {
            return true;
        } else if (botones[0].getText().equals("O") && botones[4].getText().equals("O") && botones[8].getText().equals("O")) {
            return true;
        } else if (botones[2].getText().equals("O") && botones[4].getText().equals("O") && botones[6].getText().equals("O")) {
            return true;
        }
        return false;  
    }
    



}


    

