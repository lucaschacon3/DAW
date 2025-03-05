package com.example.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.entities.Puntos;
import com.example.demo.entities.Usuario;
import com.example.demo.repositories.PuntosRepository;
import com.example.demo.repositories.UsuarioRepository;

@Service
public class ServicePrueba {
	
	@Autowired
	UsuarioRepository usuarioRepository;
	
	@Autowired
	PuntosRepository puntosRepository;


	public Usuario getOrCreateUsuario(String nombre) {
		
		Usuario usuario=usuarioRepository.findByNombre(nombre);
		
		if(usuario==null) {
			usuario=new Usuario(nombre);
			return usuario;
		}
		
		return usuario;
	}
	
	public void savePuntuacion(Usuario usuario, Long puntos) {
		
		Puntos puntuacion=new Puntos(puntos, usuario);
		puntosRepository.save(puntuacion);
	}
	
	public List<Puntos> findAllByOrderPuntuacionesDesc(){
		
		return puntosRepository.findTop10ByOrderByPuntuacionDesc();
	}
	
	public List<Puntos> getTopPuntuacionesByJugador(Long jugadorId, int limit){
		
		List <Puntos> puntuacion= puntosRepository.findByUsuarioIdOrderByPuntuacionDesc(jugadorId);
		return puntuacion.stream().limit(limit).toList();
	}
	
}
