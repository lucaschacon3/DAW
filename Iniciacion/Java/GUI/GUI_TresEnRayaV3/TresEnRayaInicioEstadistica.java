package GUI_TresEnRayaV3;

import java.awt.Color;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.beans.Statement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.*;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;

public class TresEnRayaInicioEstadistica implements ActionListener{
    private JFrame ventana;
    private JPanel panel;

    private JLabel jugadas;
    private JLabel ganadas;
    private JLabel perdidas;
    private JLabel empatadas;

    private JLabel jugadasLabel;
    private JLabel ganadasLabel;
    private JLabel perdidasLabel;
    private JLabel empatadasLabel;

    private JButton atras;

    static Connection miConexion;
    static java.sql.Statement miStatement;
    static ResultSet miResultset;

    public TresEnRayaInicioEstadistica(){
        ventana = new JFrame("Estadísticas");

        ventana.setBounds(600, 300, 230, 250);
        ventana.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);

        panel = new JPanel();
        panel.setBackground(new Color(200, 0, 0));
        ventana.add(panel);

        String URI = "jdbc:mysql://localhost:3306/tres_en_raya";
        String user = "admin";
        String password = "lucas";
        
        // creamos la conexion
        try {
            miConexion = DriverManager.getConnection(URI, user, password);
            miStatement = miConexion.createStatement();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }

        agregaComponentes();

        ventana.setVisible(true);
    }

    private void agregaComponentes() {

        jugadasLabel= new JLabel("Partidas Jugadas: ");
        panel.add(jugadasLabel);

        jugadas=new JLabel(jugadas()+"");
        panel.add(jugadas);

        ganadasLabel= new JLabel("Partidas Ganadas: ");
        panel.add(ganadasLabel);

        ganadas=new JLabel(ganadas()+"");
        panel.add(ganadas);

        perdidasLabel= new JLabel("Partidas Perdidas: ");
        panel.add(perdidasLabel);

        perdidas=new JLabel(perdidas()+"");
        panel.add(perdidas);

        empatadasLabel= new JLabel("Partidas Empatadas: ");
        panel.add(empatadasLabel);

        empatadas=new JLabel(empatadas()+"");
        panel.add(empatadas);

        atras=new JButton("Atras");
        atras.addActionListener(this);
        panel.add(atras);


    }

    public int jugadas(){
        try {
            String instruccionSQL = "SELECT jugadas FROM jugador";
            miResultset = miStatement.executeQuery(instruccionSQL);
            while (miResultset.next()) {
                return miResultset.getInt("jugadas");
            }
            return -1;
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return -1;
        }
    }

    public int ganadas(){
        try {
            String instruccionSQL = "SELECT ganadas FROM jugador";
            miResultset = miStatement.executeQuery(instruccionSQL);
            while (miResultset.next()) {
                return miResultset.getInt("ganadas");
            }
            return -1;
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return -1;
        }
    }

    public int perdidas(){
        try {
            String instruccionSQL = "SELECT perdidas FROM jugador";
            miResultset = miStatement.executeQuery(instruccionSQL);
            while (miResultset.next()) {
                return miResultset.getInt("perdidas");
            }
            return -1;
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return -1;
        }
    }

    public int empatadas(){
        try {
            String instruccionSQL = "SELECT empatadas FROM jugador";
            miResultset = miStatement.executeQuery(instruccionSQL);
            while (miResultset.next()) {
                return miResultset.getInt("empatadas");
            }
            return -1;
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return -1;
        }
    }

    @Override
    public void actionPerformed(ActionEvent e) {
        if (e.getSource()==atras) {
            TresEnRayaMenu menu =new TresEnRayaMenu();
            ventana.dispose();
            
        }
    }

}
