package ies.goya.examen.ud6;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/personajes")
public class BobEsponjaController {
	
	@Autowired
	RepositoryPersonaje repositoryPersonaje;
	
	@GetMapping
	public ResponseEntity<Iterable<Personaje>> getAll(){
		
		return ResponseEntity.status(HttpStatus.OK).body(repositoryPersonaje.findAll());
	}
	
	@GetMapping(path="/{id}")
	public ResponseEntity<?> GetAllById(@PathVariable(name="id")Long id){
		
		Personaje personaje= repositoryPersonaje.findById(id).orElse(null);
		if(personaje==null) {
			return ResponseEntity.status(HttpStatus.NOT_FOUND).body("Personaje no encontrado con id "+id);
		}
		return ResponseEntity.status(HttpStatus.OK).body(personaje);
	}
	
	@PostMapping
	public ResponseEntity<?> save(@RequestBody Personaje personaje){
		
		
		if(personaje.getId()!=null) {
			return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("No poner id en el cuerpo");
		}
		
		boolean existePersonaje= repositoryPersonaje.findByNombre(personaje.getNombre()).isPresent();
		if (existePersonaje) {
			return ResponseEntity.status(HttpStatus.CONFLICT).body("Personaje con nombre ya existe");
		}
		return ResponseEntity.status(HttpStatus.CREATED).body(repositoryPersonaje.save(personaje));
	}
	
	@PostMapping(path="/{id}")
	public ResponseEntity<?> postId(@PathVariable(name="id")Long id, @RequestBody Personaje personaje){
		return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("Sobra el ID");
	}
	
	@DeleteMapping(path="/{id}")
	public ResponseEntity<?> deleteById(@PathVariable(name="id")Long id){
		
		boolean existePersonaje= repositoryPersonaje.findById(id).isPresent();
		
		if(existePersonaje) {
			repositoryPersonaje.deleteById(id);
			return ResponseEntity.status(HttpStatus.NO_CONTENT).build();
		}
		return ResponseEntity.status(HttpStatus.NOT_FOUND).body("Peronaje no encontrado "+id);
	}
	
	@PutMapping(path="/{id}")
	public ResponseEntity<?> updateById(@PathVariable(name="id")Long id, @RequestBody Personaje request){
		/*if(!request.getId().equals(id)) {
			return ResponseEntity.status(HttpStatus.CONFLICT).body("Id del cuerpo diferente a Id url");
		}
		*/

		boolean existePersonaje= repositoryPersonaje.findById(id).isPresent();
		
		if(existePersonaje) {
			Personaje personaje= repositoryPersonaje.findById(id).orElseThrow();
			
			
			boolean existePersonajeRequest= repositoryPersonaje.findByNombre(request.getNombre()).isPresent();
			if(existePersonajeRequest) {
				return ResponseEntity.status(HttpStatus.CONFLICT).body("Personaje con nombre ya existe");
			}
			personaje.setNombre(request.getNombre());
			personaje.setDescripción(request.getDescripción());
			
			return ResponseEntity.status(HttpStatus.NO_CONTENT).body(repositoryPersonaje.save(personaje));
		}
		return ResponseEntity.status(HttpStatus.NOT_FOUND).body("Personaje no encontrado "+id);
	}
	
	@PatchMapping(path="/{id}")
	public ResponseEntity<?> partialUpdateById(@PathVariable(name="id")Long id, @RequestBody Map<String,Object> request){

		
		boolean existePersonaje= repositoryPersonaje.findById(id).isPresent();
		
		if(existePersonaje) {
			Personaje personaje= repositoryPersonaje.findById(id).orElseThrow();
			
			if(request.containsKey("nombre")) {
				personaje.setNombre((String)request.get("nombre"));
			}
			
			if(request.containsKey("descripción")) {
				personaje.setDescripción((String)request.get("descripción"));
			}
			if(request.containsKey("id")) {
				//return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("El cuerpo no puede tener Id");
			}
			return ResponseEntity.status(HttpStatus.NO_CONTENT).body(repositoryPersonaje.save(personaje));
		}
		return ResponseEntity.status(HttpStatus.NOT_FOUND).body("Personaje no encontrado "+id);
	}
		
	


}