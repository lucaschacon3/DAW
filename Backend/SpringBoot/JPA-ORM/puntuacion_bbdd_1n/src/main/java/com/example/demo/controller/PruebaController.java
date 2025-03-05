package com.example.demo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.demo.entities.Usuario;
import com.example.demo.service.ServicePrueba;



@Controller
public class PruebaController {
	
	@Autowired
	ServicePrueba servicePrueba;

	@GetMapping("/")
	public String inicio() {

		return "form";
	}

	@PostMapping("/form")
	public String procesarForm(@RequestParam(value = "nombre", required = false) String nombre,
			@RequestParam(value = "puntos", required = false) Long puntos, Model modelo) {
		
		modelo.addAttribute("nombre", nombre);
		modelo.addAttribute("puntos", puntos);
		
		Usuario usuario=servicePrueba.getOrCreateUsuario(nombre);
		servicePrueba.savePuntuacion(usuario, puntos);
		
		modelo.addAttribute("puntuaciones", servicePrueba.findAllByOrderPuntuacionesDesc());
		modelo.addAttribute("puntuaciones_top", servicePrueba.getTopPuntuacionesByJugador(usuario.getId(), 5));
		return "result";
	}

}
