package com.example.demo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;


@Controller
public class FormularioController {
	
	String[] SIGNOS= {"Tauro", "Libra", "Sagitario"};
	String[] AFICIONES= {"Lectura", "Videojuegos", "Películas"};

	@GetMapping("/")
	public String formulario() {

		return "formulario";
	}

	@PostMapping("/formulario")
	public String procesarFormulario(@RequestParam(name = "nombre", required = false) String nombre,
			@RequestParam(name = "correo", required = false) String correo,
			@RequestParam(name = "edad", required = false) Integer edad,
			@RequestParam(name = "contrasena", required = false) String contrasena,
			@RequestParam(name = "signo", required = false) Integer signo,
			@RequestParam(name = "aficiones", required = false) List<String> aficiones,
			@RequestParam(name = "condiciones", required = false) Integer condiciones,
			Model modelo) {
		
		
		
		
		if(nombre==null || nombre.isBlank()) {
			modelo.addAttribute("errorNombre", "Debe introducir un nombre");
			return "formulario";
		}
		modelo.addAttribute("nombre", nombre);
		

		
		
		
		if(correo==null || correo.isBlank()) {
			modelo.addAttribute("errorCorreo", "Debe introducir un correo");
			return "formulario";
		}
		modelo.addAttribute("correo", correo);

		
		
		
		
		
		if(edad==null || edad<18) {
			modelo.addAttribute("errorEdad", "Debe introducir una edad mayor a 18");
			return "formulario";
		}
		modelo.addAttribute("edad", edad);
		
		
		
		
		
		if(contrasena==null || contrasena.isBlank() || contrasena.length()<8) {
			modelo.addAttribute("errorContrasena", "Debe introducir una contraseña con 8 digitos");
			return "formulario";
		}
		modelo.addAttribute("contrasena", contrasena);
		
		
		
		
		if(signo==null) {
			modelo.addAttribute("errorSigno", "Debe introducir un signo");
			return "formulario";
		}
		modelo.addAttribute("signo", SIGNOS[signo]);
		
		
		
		
		
		if(aficiones==null) {
			modelo.addAttribute("errorAficiones", "Debe introducir almenos una aficion");
			return "formulario";
		}
		
		List<String> aficionesS= new ArrayList<>();
		
		for(String aficion : aficiones) {
			aficionesS.add(AFICIONES[Integer.parseInt(aficion)]);
		}
		
		modelo.addAttribute("aficiones", aficionesS);
		
		
		
		
		
		if(condiciones==null) {
			modelo.addAttribute("errorCondiciones", "Estás de acuerdo");
			return "formulario";
		}else if (condiciones==0){
			modelo.addAttribute("condiciones", "No ha aceptado las condiciones");
		}else if (condiciones==1){
			modelo.addAttribute("condiciones", "Ha aceptado las condiciones");
		}

		
		
		return "resultado";
	}

}
