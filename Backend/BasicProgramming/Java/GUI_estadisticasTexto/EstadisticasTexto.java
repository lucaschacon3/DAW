package GUI_estadisticasTexto;

import javax.swing.*;
import javax.swing.event.DocumentEvent;
import javax.swing.event.DocumentListener;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

public class EstadisticasTexto implements ActionListener{

    private JFrame ventana;
    private JPanel panel;
    private JTextField textoArea;
    private JLabel letrasLabel, palabrasLabel, espaciosLabel, vocalesLabel, consonantesLabel;
    private JButton actualizar;

    public EstadisticasTexto() {
        ventana = new JFrame("EstadisticasTexto");

        ventana.setBounds(600, 300, 250, 250);
        ventana.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        panel = new JPanel();
        ventana.add(panel);

        agregaComponentes();

        ventana.setVisible(true);
    }

    private void agregaComponentes() {

        textoArea=new JTextField(10);
        panel.add(textoArea);


        letrasLabel = new JLabel("Número de letras: 0");
        palabrasLabel = new JLabel("Número de palabras: 0");
        espaciosLabel = new JLabel("Número de espacios: 0");
        vocalesLabel = new JLabel("Número de vocales: 0");
        consonantesLabel = new JLabel("Número de consonantes: 0");

        panel.add(letrasLabel);
        panel.add(palabrasLabel);
        panel.add(espaciosLabel);
        panel.add(vocalesLabel);
        panel.add(consonantesLabel);

        actualizar=new JButton("Actualizar");
        actualizar.addActionListener(this);
        panel.add(actualizar);

    }

    @Override
    public void actionPerformed(ActionEvent e) {

        String texto = textoArea.getText();
        int numLetras = texto.replaceAll("\\s+", "").length();
        int numPalabras = texto.split("\\s+").length;
        int numEspacios = texto.length() - numLetras;
        int numVocales = texto.replaceAll("[^aeiouAEIOUáéíóúÁÉÍÓÚ]", "").length();
        int numConsonantes = numLetras - numVocales;

        letrasLabel.setText("Número de letras: " + numLetras);
        palabrasLabel.setText("Número de palabras: " + numPalabras);
        espaciosLabel.setText("Número de espacios: " + numEspacios);
        vocalesLabel.setText("Número de vocales: " + numVocales);
        consonantesLabel.setText("Número de consonantes: " + numConsonantes);
    }

}

