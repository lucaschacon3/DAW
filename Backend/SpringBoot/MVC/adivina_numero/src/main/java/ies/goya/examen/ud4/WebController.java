package ies.goya.examen.ud4;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import jakarta.servlet.http.HttpSession;

@Controller
public class WebController {
	final static int MAX_INTENTOS=6;
	final static int TOPE=50;
	int intentosRestantes=MAX_INTENTOS;
	Random random = new Random();
	int aleatorio;
	
	List<Integer> listaIntentos = new ArrayList<>();
	
	public int generarAleatorio() {
		return random.nextInt(TOPE)+1;
	}

	
	@GetMapping("/")
	public String iniciaPartida(Model modelo, HttpSession sesion) {
		aleatorio=generarAleatorio();
		modelo.addAttribute("aleatorio", aleatorio);
		
		sesion.removeAttribute("intentosRestantes");
		intentosRestantes=MAX_INTENTOS;
		
		sesion.removeAttribute("listaIntentos");
		listaIntentos.clear();
		
		modelo.addAttribute("tope", TOPE);
		modelo.addAttribute("intentosRestantes", intentosRestantes);
		return "formAdivina";
	}
	
	@PostMapping("/")
	public String procesarJuego(Model modelo, HttpSession sesion, @RequestParam(name="numero", required=false) Integer numero) {
		modelo.addAttribute("tope", TOPE);
		modelo.addAttribute("intentosRestantes", intentosRestantes);
		sesion.setAttribute("intentosRestantes", intentosRestantes);
		
		modelo.addAttribute("aleatorio", aleatorio);
		
		modelo.addAttribute("numero", numero);
		sesion.setAttribute("numero", numero);
		
		
		modelo.addAttribute("listaIntentos", listaIntentos);
		sesion.setAttribute("listaIntentos", listaIntentos);
		
		
		if(numero==null || numero<0) {
			modelo.addAttribute("errorNumero", "Debe intoducir un número y mayor que 0");
		}else {
			if(numero==aleatorio) {
				
				modelo.addAttribute("ganaste", "Enhorabuena, lo has acertado en "+intentosRestantes+ " intentos");
				listaIntentos.add(numero);
			}else if(intentosRestantes<=0){
				intentosRestantes=0;
				
			}else {
				intentosRestantes--;
				listaIntentos.add(numero);
			}
		}
		
		if(intentosRestantes<=0) {
			modelo.addAttribute("perdiste", "Lo sentimos, no lo has acertado en los intentos disponibles.");
		}
		
		
		return "formAdivina";
	}
}
