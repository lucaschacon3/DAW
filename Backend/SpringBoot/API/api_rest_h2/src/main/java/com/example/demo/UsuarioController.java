package com.example.demo;

import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
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
@RequestMapping("/usuarios")
public class UsuarioController {

	@Autowired
	UsuarioRepository usuarioRepository;
	
	@GetMapping
	public ResponseEntity<List<Usuario>> getAll(){
		
		return ResponseEntity.ok(usuarioRepository.findAll());
	}
	
	@GetMapping(path="/{id}")
	public ResponseEntity<Usuario> getbyId(@PathVariable(name="id")Long id){
		
		Usuario usuario=usuarioRepository.findById(id).orElse(null);
		
		if(usuario==null) {
			return ResponseEntity.notFound().build();
		}
		return ResponseEntity.ok(usuario);
	}
	
	@PostMapping
	public ResponseEntity<?> save(@RequestBody Usuario usuario){
		//comprobar si el email existe con findByEmail en repositorio
		boolean existeEmail=usuarioRepository.findByEmail(usuario.getEmail()).isPresent();
		
		if(existeEmail) {
			return ResponseEntity.badRequest().body("usuario Existente");
		}
		return ResponseEntity.ok(usuarioRepository.save(usuario));
	}
	
	@DeleteMapping(path="/{id}")
	public ResponseEntity<?> delete(@PathVariable(name="id") Long id){
		
		boolean existeId= usuarioRepository.findById(id).isPresent();
		
		if(existeId) {
			usuarioRepository.deleteById(id);
			return ResponseEntity.ok("Eliminado con id "+id);
		}
		return ResponseEntity.notFound().build();
		
	}
	
	@PutMapping(path="/{id}")
	public ResponseEntity<?> update(@PathVariable(name="id")Long id, @RequestBody Usuario request){
		
		boolean existeId= usuarioRepository.findById(id).isPresent();
		if(existeId) {
			Usuario usuario=usuarioRepository.findById(id).orElseThrow();
			
			usuario.setNombre(request.getNombre());
			usuario.setEmail(request.getEmail());
			
			return ResponseEntity.ok(usuarioRepository.save(usuario));
			
		}else {
			return ResponseEntity.notFound().build();
		}
	}
	
	@PatchMapping(path="/{id}")
	public ResponseEntity<?> partialUpdate(@PathVariable(name="id")Long id, @RequestBody Map<String,Object> updates){
		
		boolean existeId= usuarioRepository.findById(id).isPresent();
		if(existeId) {
			Usuario usuario=usuarioRepository.findById(id).orElseThrow();
			
			if(updates.containsKey("nombre")) {
				usuario.setNombre((String) updates.get("nombre"));
			}
			
			if(updates.containsKey("email")) {
				usuario.setEmail((String) updates.get("email"));
			}
			
			return ResponseEntity.ok(usuarioRepository.save(usuario));
			
		}else {
			return ResponseEntity.notFound().build();
		}
	}
	
}
