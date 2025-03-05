package ies.goya.examen.ud5.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import ies.goya.examen.ud5.model.Alumno;

@Repository
public interface AlumnoRepository extends JpaRepository<Alumno,Long> {

	Alumno findAllByNombre(String nombre);
	Alumno findAllById(Long id);
	
	Alumno findByNombreAndApellidos(String nombre, String apellidos);
	Alumno findByApellidos(String apellidos);
	
	List <Alumno> findAllByOrderByNombreDesc();
	List <Alumno> findAllByOrderByApellidosDesc();
	
	
	
}
