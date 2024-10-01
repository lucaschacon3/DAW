package GUI_TresEnRayaV3;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;
import java.awt.Color;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Random;

public class TresEnRayaJvM implements ActionListener {
    private JFrame ventana;
    private JPanel panel;

    private int jugadas;
    private int ganadas;
    private int perdidas;
    private int empatadas;

    static Connection miConexion;
    static java.sql.Statement miStatement;
    static ResultSet miResultset;

    private JLabel informacionLabel;

    private JButton[] botones;
    private JButton reiniciar;
    private JButton atras;

    private int turno;

    public TresEnRayaJvM() {
        this.turno = 0;
        ventana = new JFrame("3 en raya");

        ventana.setBounds(600, 300, 160, 210);
        ventana.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);

        panel = new JPanel();
        panel.setBackground(new Color(200, 0, 0));
        ventana.add(panel);

        String URI = "jdbc:mysql://localhost:3306/tres_en_raya";
        String user = "admin";
        String password = "lucas";

        // Creando la conexión
        try {
            miConexion = DriverManager.getConnection(URI, user, password);
            miStatement = miConexion.createStatement();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }

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
        if (e.getSource() == reiniciar) {
            Reiniciar();
            return;
        }

        if (e.getSource() == atras) {
            FuncionAtras();
            return;
        }

        // Jugador X juega
        for (int i = 0; i < 9; i++) {
            if (e.getSource() == botones[i]) {
                if (turno % 2 == 0 && botones[i].getText().equals("-")) {
                    botones[i].setText("X");
                    botones[i].setEnabled(false);
                    turno++;
                    return;
                }
            }
        }

        // Computadora juega como O
        if (turno % 2 == 1) {
            Random random = new Random();
            int aleatorio;
            do {
                aleatorio = random.nextInt(9);
            } while (!botones[aleatorio].getText().equals("-"));
            botones[aleatorio].setText("O");
            botones[aleatorio].setEnabled(false);
            turno++;
            
        }
        verificarEstado();
    }

    private void verificarEstado() {
        // Verificar ganador
        if (ganaJ1()) {
            informacionLabel.setText("Ha ganado J1");
            desactivarBotones();
            actualizarEstadisticas("ganadas");
            actualizarEstadisticas("jugadas");
        } else if (ganaJ2()) {
            informacionLabel.setText("Ha ganado J2");
            desactivarBotones();
            actualizarEstadisticas("perdidas");
            actualizarEstadisticas("jugadas");
        } else if (turno == 9) {
            if (!ganaJ1() && !ganaJ2()) {
                informacionLabel.setText("Empate");
                actualizarEstadisticas("empatadas");
                actualizarEstadisticas("jugadas");
            }
        }

    }

    private void actualizarEstadisticas(String tipo) {
        String instruccionSQL = "SELECT " + tipo + " FROM jugador";
        int valorActual = getEstadistica(instruccionSQL);
        String instruccionUpdateSQL = "UPDATE jugador SET " + tipo + " = " + (valorActual + 1);
        try {
            miStatement.executeUpdate(instruccionUpdateSQL);
        } catch (SQLException e1) {
            e1.printStackTrace();
        }
    }

    private int getEstadistica(String instruccionSQL) {
        try (ResultSet resultSet = miStatement.executeQuery(instruccionSQL)) {
            if (resultSet.next()) {
                return resultSet.getInt(1);
            }
        } catch (SQLException e1) {
            e1.printStackTrace();
        }
        return 0;
    }

    private void desactivarBotones() {
        for (JButton boton : botones) {
            boton.setEnabled(false);
        }
    }

    private void FuncionAtras() {
        new TresEnRayaMenu();
        ventana.dispose();
    }

    private void Reiniciar() {
        for (JButton boton : botones) {
            boton.setText("-");
            boton.setEnabled(true);
        }
        informacionLabel.setText("Informacion 3 en raya");
        turno = 0;
    }

    public boolean ganaJ1() {
        return verificarGanador("X");
    }

    public boolean ganaJ2() {
        return verificarGanador("O");
    }

    private boolean verificarGanador(String marca) {
        return (botones[0].getText().equals(marca) && botones[1].getText().equals(marca) && botones[2].getText().equals(marca)) ||
               (botones[3].getText().equals(marca) && botones[4].getText().equals(marca) && botones[5].getText().equals(marca)) ||
               (botones[6].getText().equals(marca) && botones[7].getText().equals(marca) && botones[8].getText().equals(marca)) ||
               (botones[0].getText().equals(marca) && botones[3].getText().equals(marca) && botones[6].getText().equals(marca)) ||
               (botones[1].getText().equals(marca) && botones[4].getText().equals(marca) && botones[7].getText().equals(marca)) ||
               (botones[2].getText().equals(marca) && botones[5].getText().equals(marca) && botones[8].getText().equals(marca)) ||
               (botones[0].getText().equals(marca) && botones[4].getText().equals(marca) && botones[8].getText().equals(marca)) ||
               (botones[2].getText().equals(marca) && botones[4].getText().equals(marca) && botones[6].getText().equals(marca));
    }
}
