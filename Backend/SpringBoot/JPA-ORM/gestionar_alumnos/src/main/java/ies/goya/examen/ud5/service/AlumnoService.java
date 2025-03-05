package ies.goya.examen.ud5.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ies.goya.examen.ud5.model.Alumno;
import ies.goya.examen.ud5.model.Email;
import ies.goya.examen.ud5.repository.AlumnoRepository;
import ies.goya.examen.ud5.repository.EmailRepository;

@Service
public class AlumnoService {
	
	
	@Autowired
	AlumnoRepository alumnoRepository;
	
	@Autowired
	EmailRepository emailRepository;

	public AlumnoService(AlumnoRepository alumnoRepository) {
		this.alumnoRepository = alumnoRepository;
	}

	// Obtener un alumno a partir de su id
	public String get(Long id) {
		Alumno alumno=alumnoRepository.findAllById(id);
		if(alumno==null) {
			return "Alumno no existe";
		}
		return alumno.toString();
	}

	// Obtener todos los alumnos
	public String getAll() {
		//List<Email> emails=emailRepository.findAll();
		List<Alumno> alumnos =alumnoRepository.findAll();
		
		return alumnos.toString();
	}

	// Obtener todos los alumnos
	public String getAllOrderByNombre() {
		List<Alumno> lista=alumnoRepository.findAllByOrderByNombreDesc();
		return lista.toString();
	}

	// Obtener todos los alumnos
	public String getAllOrderByApellidos() {
		
		List<Alumno> lista=alumnoRepository.findAllByOrderByApellidosDesc();
		return lista.toString();
	}

	// Añadir un alumno
	public String add(String nombre, String apellidos) {
		Alumno alumno = alumnoRepository.findAllByNombre(nombre);
		if(alumno==null) {
			alumno=new Alumno(nombre,apellidos);
			alumnoRepository.save(alumno);
			return "Alumno creado "+alumno.toString();
		}
		return "El alumno ya existe";
	}

	// Modificar un alumno
	public String merge(Long id, String nombre, String apellidos) {
		Alumno alumno=alumnoRepository.findAllById(id);
		
		if(alumno==null) {
			return "Alumno no existe";
		}
		alumnoRepository.delete(alumno);
		alumnoRepository.save(new Alumno(id,nombre,apellidos));
		return "Alumno modificado "+alumno.toString();
	}

	// Borrar un alumno
	public String delete(Long id) {
		Alumno alumno=alumnoRepository.findAllById(id);
		if(alumno==null) {
			return "Alumno no existe";
		}
		alumnoRepository.delete(alumno);
		
		
		return "Alumno eliminado "+alumno.toString();
	}

	// Asociar un email a un alumno
	public String addEmailToAlumno(Long id, String emailStr) {
		
		Alumno alumno= alumnoRepository.findAllById(id);
		
		if(alumno==null) {
			return "el usuario no existe";
		}
		Email email=new Email(emailStr, alumno);
		emailRepository.save(email);
		return "Añadido email a alumno: " + alumno.toString();
	}

	// Desasociar en email de un alumno
	public String delEmailFromAlumno(Long id, String emailStr) {
		
		Alumno alumno= alumnoRepository.findAllById(id);
		
		if(alumno==null) {
			return "el usuario no existe";
		}
		Email email= (Email) emailRepository.findAllById(alumno.getId());
		emailRepository.delete(email);

		return "Borrado email de alumno: " + alumno.toString();
	}

	// Buscar alumno por nombre y apellidos
	public String findByNombreAndApellidos(String nombre, String apellidos) {
		Alumno alumno= alumnoRepository.findByNombreAndApellidos(nombre, apellidos);
		if(alumno==null) {
			return "Alumno no existe";
		}
		
		return alumno.toString();
	}

	// Buscar alumno por nombre y apellidos
	public String findByNombre(String nombre) {
		Alumno alumno= alumnoRepository.findAllByNombre(nombre);
		if(alumno==null) {
			return "Alumno no existe";
		}
		
		return alumno.toString();
	}
	
	// Buscar alumno por nombre y apellidos
	public String findByApellidos(String apellidos) {
		Alumno alumno= alumnoRepository.findByApellidos(apellidos);
		if(alumno==null) {
			return "Alumno no existe";
		}
		
		return alumno.toString();
	}

}
