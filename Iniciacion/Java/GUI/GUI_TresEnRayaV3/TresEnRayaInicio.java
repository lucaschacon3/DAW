package GUI_TresEnRayaV3;

import java.awt.Color;
import java.awt.Menu;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JTextField;

public class TresEnRayaInicio implements ActionListener{
    private JFrame ventana;
    private JPanel panel;

    private JLabel etiquetaUsuario;
    private JTextField usuario;
    private JButton entrar;

    private JLabel info;

    public TresEnRayaInicio(){
        ventana = new JFrame("Inicio");

        ventana.setBounds(600, 300, 300, 250);
        ventana.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);

        panel = new JPanel();
        panel.setBackground(new Color(200, 0, 0));
        ventana.add(panel);

        agregaComponentes();

        ventana.setVisible(true);
    }

    private void agregaComponentes() {
        etiquetaUsuario=new JLabel("Usuario: ");
        panel.add(etiquetaUsuario);

        usuario=new JTextField(10);
        panel.add(usuario);

        entrar=new JButton("Entrar");
        entrar.addActionListener(this);
        panel.add(entrar);

        info=new JLabel(" ");
        panel.add(info);
    }

    @Override
    public void actionPerformed(ActionEvent e) {
        if (e.getSource()==entrar) {
            if (usuario.getText().equals("Lucas")) {
                TresEnRayaMenu menu =new TresEnRayaMenu();
                ventana.dispose();
                
            }else{
                info.setText("ERROR: Usuario no exixte");
            }

        }
    }


}
