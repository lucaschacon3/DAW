package GUI_TresEnRayaV2;

import java.awt.Dimension;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JTextField;

public class VentanaTresEnRaya extends JFrame implements ActionListener{
	private JPanel panel;
	private JButton[] botones;
	private JButton botonReiniciar;
	private JLabel etiquetaResultado;
	LogicaTresEnraya logica = new LogicaTresEnraya();
	
	public VentanaTresEnRaya() {
		super("Tres en Raya");
		setBounds(100, 100, 240, 280);
		setDefaultCloseOperation(EXIT_ON_CLOSE);
		construirPanel();
		setVisible(true);
	}
	public void construirPanel() {
		panel=new JPanel();
		botones=new JButton[9];
		for (int i=0;i<9;i++) {
			botones[i]=new JButton("");
			botones[i].setPreferredSize(new Dimension(60,60));
			botones[i].addActionListener(this);
			panel.add(botones[i]);
		}
		botonReiniciar=new JButton("Reiniciar");
		botonReiniciar.addActionListener(this);
		panel.add(botonReiniciar);
		
		etiquetaResultado=new JLabel("Se esta jugando");
		panel.add(etiquetaResultado);
		add(panel);
	}
	@Override
	public void actionPerformed(ActionEvent e) {
		int numeroBotonPulsado=0;
		for (int i=0;i<9;i++) { //obtenemos la casilla pulsada
			if (e.getSource()==botones[i]) {
				numeroBotonPulsado=i;
			}
		}
		if ((logica.isEsTurnoJugador1()) && (logica.casillaVacia(numeroBotonPulsado))
				&& (!logica.ganaJugador(2)) && (logica.quedanCasillas()))
		{ //si es el turno del jugador 1 ->X
			logica.setTablero(numeroBotonPulsado,1);
			botones[numeroBotonPulsado].setText("X");
			logica.setEsTurnoJugador1(false);
		}
		if ((!logica.isEsTurnoJugador1()) && (logica.casillaVacia(numeroBotonPulsado))
				&& (!logica.ganaJugador(1)) && (logica.quedanCasillas())) 
		{//si es el turno del jugador 1 ->O
			logica.setTablero(numeroBotonPulsado,2);
			botones[numeroBotonPulsado].setText("O");
			logica.setEsTurnoJugador1(false);
		}
		//se ha pulsado el boton reiniciar
		if (e.getSource()==botonReiniciar) {
			reiniciar();
		}
		
		if (logica.ganaJugador(1)) {
			etiquetaResultado.setText("Ha ganado el jugador 1");
		}
		if (logica.ganaJugador(2)) {
			etiquetaResultado.setText("Ha ganado el jugador 2");
		}
		if (!logica.ganaJugador(1) && !logica.ganaJugador(2) && !logica.quedanCasillas()) {
			etiquetaResultado.setText("Hay empate entre jugadores");
		}
			
	}
	
	public void reiniciar() {
		for (int i=0;i<9;i++) {
			logica.setTablero(i,0);
			botones[i].setText("");
		}
	}
	
	
}
