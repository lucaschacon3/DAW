package GUI_calculadora;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JTextField;

public class Calculadora implements ActionListener {
    private JFrame ventana;
    private JPanel panel;

    private JLabel labelOperador1;
    private JLabel labelOperador2;
    private JLabel labelResultado;

    private JTextField operador1;
    private JTextField operador2;
    private JTextField resultado;

    private JButton botonSuma;
    private JButton botonResta;
    private JButton botonMultiplicacion;
    private JButton botonDivision;

    public Calculadora() {

        ventana = new JFrame("Calculadora");

        ventana.setBounds(600, 300, 750, 200);
        ventana.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);

        panel = new JPanel();
        ventana.add(panel);

        agregaComponentes();

        ventana.setVisible(true);

    }

    private void agregaComponentes() {

        //OPERADOR 1 (label y caja de texto)
        labelOperador1 = new JLabel("operador 1");
        panel.add(labelOperador1);

        operador1 = new JTextField(10);
        panel.add(operador1);


        //BOTONES DE OPERACION
        botonSuma = new JButton("suma");
        botonSuma.addActionListener(this);
        panel.add(botonSuma);

        botonResta = new JButton("resta");
        botonResta.addActionListener(this);
        panel.add(botonResta);

        botonMultiplicacion = new JButton("multiplicacion");
        botonMultiplicacion.addActionListener(this);
        panel.add(botonMultiplicacion);

        botonDivision = new JButton("division");
        botonDivision.addActionListener(this);
        panel.add(botonDivision);

        //OPERADOR 2 (label y caja de texto)
        labelOperador2 = new JLabel("operador 2");
        panel.add(labelOperador2);

        operador2 = new JTextField(10);
        panel.add(operador2);

        //RESULTADO (label y caja de texto)
        labelResultado = new JLabel("resultado");
        panel.add(labelResultado);

        resultado = new JTextField(10);
        panel.add(resultado);
    }

    @Override
    public void actionPerformed(ActionEvent e) {
        if (e.getSource() == botonSuma)
            suma();
        else if (e.getSource() == botonResta)
            resta();
        else if (e.getSource() == botonMultiplicacion)
            multiplicacion();
        else if (e.getSource() == botonDivision)
            division();
    }

    private void division() {
        if (operador2.getText().equals("0"))
            resultado.setText("No se puede dividir por 0");
        else {
            double resultadoOp = (Double.parseDouble(operador1.getText())) / (Double.parseDouble(operador2.getText()));
            resultado.setText(resultadoOp + "");
        }
    }

    private void multiplicacion() {
        double resultadoOp = (Double.parseDouble(operador1.getText())) * (Double.parseDouble(operador2.getText()));
        resultado.setText(resultadoOp + "");
    }

    private void resta() {
        double resultadoOp = (Double.parseDouble(operador1.getText())) - (Double.parseDouble(operador2.getText()));
        resultado.setText(resultadoOp + "");
    }

    private void suma() {
        double resultadoOp = (Double.parseDouble(operador1.getText())) + (Double.parseDouble(operador2.getText()));
        resultado.setText(resultadoOp + "");
    }

}
