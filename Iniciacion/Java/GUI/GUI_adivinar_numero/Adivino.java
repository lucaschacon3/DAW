package GUI_adivinar_numero;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.Random;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;

public class Adivino implements ActionListener {
    private Random random;
    
    private JFrame ventana;
    private JPanel panel;

    private JButton mas;
    private JButton menos;
    private JButton correcto;

    private JLabel numeros;
    private JLabel esCorrecto;

    private  int numAleatorio;

    public Adivino() {

        ventana = new JFrame("mi ventana");

        // ventana.setBounds(localizacionX, localizacionY, tamañoX, tamañoY);
        ventana.setBounds(600, 300, 300, 300);

        // hacemos que se pueda cerrar la ventana
        ventana.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);

        // creamos la lamina y la añadimos al marco
        panel = new JPanel();
        ventana.add(panel);

        // agregamos los componentes
        agregaComponentes();

        random=new Random();
        numAleatorio=random.nextInt(10);
        numeros.setText(numAleatorio+"");

        // hacemos visible la ventana
        ventana.setVisible(true);

    }

    private void agregaComponentes() {

        numeros= new JLabel();
        numeros.setText("");
        panel.add(numeros);


        mas = new JButton("MAS");
        mas.addActionListener(this);
        panel.add(mas);

        menos = new JButton("MENOS");
        menos.addActionListener(this);
        panel.add(menos);

        correcto = new JButton("CORRECTO");
        correcto.addActionListener(this);
        panel.add(correcto);

        esCorrecto=new JLabel();
        esCorrecto.setText("");
        panel.add(esCorrecto);

    }

    @Override
    public void actionPerformed(ActionEvent e) {

        if (e.getSource() == mas) {
            numAleatorio= (random.nextInt(10)+numAleatorio);
            numeros.setText(numAleatorio+"");
            esCorrecto.setText("Es incorrecto ");

        }else if (e.getSource()==menos) {
            numAleatorio= (numAleatorio- random.nextInt(10));
            numeros.setText(numAleatorio+"");
            esCorrecto.setText("Es incorrecto ");

        }else if (e.getSource()==correcto) {

            esCorrecto.setText("Es correcto ");
        }

    }
}
