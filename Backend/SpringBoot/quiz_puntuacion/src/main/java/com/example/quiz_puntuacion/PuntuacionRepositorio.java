package com.example.quiz_puntuacion;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface PuntuacionRepositorio extends CrudRepository<Puntuacion, Long> {
   
}
