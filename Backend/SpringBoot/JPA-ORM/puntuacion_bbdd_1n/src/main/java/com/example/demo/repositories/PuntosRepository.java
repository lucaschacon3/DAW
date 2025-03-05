package com.example.demo.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.demo.entities.Puntos;
import com.example.demo.entities.Usuario;

public interface PuntosRepository extends JpaRepository<Puntos, Long>{
	List <Puntos> findTop10ByOrderByPuntuacionDesc();
	
	List <Puntos> findByUsuarioIdOrderByPuntuacionDesc(Long usuarioId);
	
	
}
