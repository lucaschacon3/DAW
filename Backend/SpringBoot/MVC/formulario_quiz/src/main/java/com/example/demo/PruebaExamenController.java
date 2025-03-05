package com.example.demo;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import jakarta.servlet.http.HttpSession;

@Controller
public class PruebaExamenController {

	static final String[] SIGNOS = { "Aries", "Tauro", "Géminis", "Cáncer", "Leo", "Virgo", "Libra", "Escorpio",
			"Sagitario" };
	static final String[] AFICIONES = { "Deportes", "Juerga", "Lectura", "Relaciones sociales" };

	static String generaCategoría(String nombre, Integer signo, String aficciones) {
		String[] categorías = { "Tierra", "Aire", "Agua", "Fuego" };
		String[] aficcionesArray = aficciones.split(",");
		Integer num = Arrays.asList(aficcionesArray).stream().map(Integer::parseInt).reduce(0, Integer::sum);
		int indice = (nombre.length() * signo * num) % categorías.length;
		return categorías[indice];
	}

	@GetMapping("/")
	public String inicio() {
		return "etapa1";
	}

	
	@PostMapping("/etapa1")
	public String procesarEtapa1(@RequestParam(name="nombre" ,required=false)String nombre, HttpSession sesion, Model modelo) {
		
		if(nombre==null || nombre.isBlank()) {
			
			modelo.addAttribute("error", "Debe introducir un nombre");
			return "etapa1";
		}
		
		sesion.setAttribute("nombre", nombre);
		modelo.addAttribute("nombre", nombre);
		return "etapa2";
		
	}
	
	@GetMapping("/etapa1")
	public String volverEtapa1(HttpSession sesion, Model modelo) {
		
		String nombre= (String) sesion.getAttribute("nombre");
		
		modelo.addAttribute("nombre", nombre);
		return "etapa1";
	}
	
	@PostMapping("/etapa2")
	public String procesarEtapa2(@RequestParam(name="correo" ,required=false)String correo, HttpSession sesion, Model modelo) {
		
		if(correo==null || correo.isBlank() || !correo.contains("@")) {
			
			modelo.addAttribute("error", "Debe introducir un correo valido");
			return "etapa2";
		}
		
		sesion.setAttribute("correo", correo);
		return "etapa3";
		
	}
	
	@PostMapping("/etapa3")
	public String procesarEtapa3(@RequestParam(name="edad" ,required=false)Integer edad, HttpSession sesion, Model modelo) {
		
		if(edad==null || edad<18) {
			
			modelo.addAttribute("error", "Debe introducir una edad valida");
			return "etapa3";
		}
		
		sesion.setAttribute("edad", edad);
		return "etapa4";
		
	}
	
	@PostMapping("/etapa4")
	public String procesarEtapa4(@RequestParam(name="contrasena" ,required=false)String contrasena, Model modelo, HttpSession sesion) {
		
		if(contrasena==null || contrasena.length()<8) {
			
			modelo.addAttribute("error", "Debe introducir una contraseña de 8 caracteres");
			return "etapa4";
		}
		
		sesion.setAttribute("contrasena", contrasena);
		return "etapa5";
		
	}
	
	@PostMapping("/etapa5")
	public String procesarEtapa5(@RequestParam(name="signo" ,required=false)Integer signo, Model modelo, HttpSession sesion) {
		
		if(signo==null) {
			
			modelo.addAttribute("error", "Debe introducir un signo");
			return "etapa5";
		}
		
		sesion.setAttribute("signo", signo);
		return "etapa6";
		
	}
	
	
	@PostMapping("/etapa6")
	public String procesarEtapa6(@RequestParam(name="aficiones" ,required=false)List<String> aficiones, Model modelo, HttpSession sesion) {
		
		if(aficiones==null || aficiones.isEmpty()) {
			
			modelo.addAttribute("error", "Debe introducir alguna aficcion");
			return "etapa6";
		}
		
		sesion.setAttribute("aficiones", aficiones);
		return "etapa7";
		
	}
	
	@PostMapping("/etapa7")
	public String procesarEtapa7(@RequestParam(name="condiciones" ,required=false)Integer condiciones, Model modelo, HttpSession sesion) {
		
		if(condiciones==null) {
			
			modelo.addAttribute("error", "Debe introducir alguna opción");
			return "etapa7";
		}
		if(condiciones==0) {
			modelo.addAttribute("condiciones", "Se han aceptado las condiciones");
		}else {
			modelo.addAttribute("condiciones", "No han aceptado las condiciones");
		}
		
		
		String nombre= (String)sesion.getAttribute("nombre");
		modelo.addAttribute("nombre", nombre);
		
		String correo= (String)sesion.getAttribute("correo");
		modelo.addAttribute("correo", correo);
		
		Integer edad= (Integer)sesion.getAttribute("edad");
		modelo.addAttribute("edad", edad);
		
		Integer signo= (Integer)sesion.getAttribute("signo");
		modelo.addAttribute("signo", SIGNOS[signo-1]);
		
		List<String> aficionesString= new ArrayList<>();
		@SuppressWarnings("unchecked")
		List<String> aficiones= (List<String>) sesion.getAttribute("aficiones");
		for(String aficion: aficiones) {
			aficionesString.add(AFICIONES[Integer.parseInt(aficion)]);
		}
		modelo.addAttribute("aficiones", aficionesString);
		
		modelo.addAttribute("categoria", generaCategoría(nombre, signo, String.join(",", aficiones)));
		
		
		return "resultado";
		
	}
	
	

}
