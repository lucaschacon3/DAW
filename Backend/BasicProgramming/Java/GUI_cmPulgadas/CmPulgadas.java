package GUI_cmPulgadas;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JTextField;


import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;


public class CmPulgadas implements ActionListener{
    private JFrame ventana;
    private JPanel panel;

    private JLabel cmLabel;
    private JLabel pulgadasLabel;

    private JTextField cmTextField;
    private JTextField pulgadasTextField;

    private JButton convertirAPulgadasButton;
    private JButton convertirACmButton;

    public CmPulgadas(){
        ventana = new JFrame("Cm y pulgadas");

        ventana.setBounds(600, 300, 650, 200);
        ventana.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);

        panel = new JPanel();
        ventana.add(panel);

        agregaComponentes();

        ventana.setVisible(true);
    }

    public void agregaComponentes(){

        cmLabel =new JLabel("CM: ");
        panel.add(cmLabel);

        cmTextField =new JTextField(15);
        panel.add(cmTextField);

        pulgadasLabel =new JLabel("PULGADAS: ");
        panel.add(pulgadasLabel);

        pulgadasTextField =new JTextField(15);
        panel.add(pulgadasTextField);

        convertirAPulgadasButton=new JButton("Convertir a pulgadas ");
        convertirAPulgadasButton.addActionListener(this);
        panel.add(convertirAPulgadasButton);

        convertirACmButton=new JButton("Convertir a cm ");
        convertirACmButton.addActionListener(this);
        panel.add(convertirACmButton);
    }

    @Override
    public void actionPerformed(ActionEvent e) {

        if (e.getSource() == convertirAPulgadasButton){
            if(pulgadasTextField.getText().equals("") && cmTextField.getText().equals("")){
                cmTextField.setText("Error chavalín");
                pulgadasTextField.setText("Error chavalín");
            }
            Double pulgadas= Double.parseDouble(cmTextField.getText())/2.54;
            pulgadasTextField.setText(pulgadas+"");

        }else if (e.getSource() == convertirACmButton) {
            if(pulgadasTextField.getText().equals("") && cmTextField.getText().equals("")){
                cmTextField.setText("Error chavalín");
                pulgadasTextField.setText("Error chavalín");
            }
            Double cm= Double.parseDouble(pulgadasTextField.getText())*2.54;
            cmTextField.setText(cm+"");

        }
        
    }


}
