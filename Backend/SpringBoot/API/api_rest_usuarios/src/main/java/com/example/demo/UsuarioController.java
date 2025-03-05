package com.example.demo;

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
@RequestMapping("/usuarios")
public class UsuarioController {
	
	@Autowired
	UsuarioRepository usuarioRepository;
	
	@GetMapping
	public ResponseEntity<List<Usuario>> getAll(){
		
		return ResponseEntity.status(HttpStatus.OK).body(usuarioRepository.findAll());
	}
	
	@GetMapping(path="/{id}")
	public ResponseEntity<Usuario> getById(@PathVariable(name="id")Long id){
		Usuario usuario = usuarioRepository.findById(id).orElse(null);
		
		if(usuario==null) {
			return ResponseEntity.status(HttpStatus.NOT_FOUND).build();
		}
		return ResponseEntity.status(HttpStatus.OK).body(usuario);
	}
	
	@PostMapping
	public ResponseEntity<?> save(@RequestBody Usuario usuario){
		boolean existeUsuario= usuarioRepository.findByEmail(usuario.getEmail()).isPresent();
		
		if(existeUsuario) {
			
			return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("usuario ya presente");
		}
		return ResponseEntity.status(HttpStatus.CREATED).body(usuarioRepository.save(usuario));
		
	}
	
	@DeleteMapping(path= {"/id"})
	public ResponseEntity<?> delete(@PathVariable(name="id")Long id){
		
		boolean existeUsuario= usuarioRepository.findById(id).isPresent();
		if(existeUsuario) {
			usuarioRepository.deleteById(id);
			return ResponseEntity.status(HttpStatus.NO_CONTENT).build();
		}
		return ResponseEntity.status(HttpStatus.NOT_FOUND).build();
	}
	
	@PutMapping(path="/{id}") 
	public ResponseEntity<?> update(@PathVariable(name="id")Long id, @RequestBody Usuario request){
		boolean existeUsuario= usuarioRepository.findById(id).isPresent();
		if(existeUsuario) {
			Usuario usuario = usuarioRepository.findById(id).orElseThrow();
			
			usuario.setNombre(request.getNombre());
			usuario.setEmail(request.getEmail());
			
			return ResponseEntity.status(HttpStatus.OK).body(usuarioRepository.save(usuario));
			
		}
		return ResponseEntity.status(HttpStatus.NOT_FOUND).build();
	}
	
	@PatchMapping(path="/{id}") 
	public ResponseEntity<?> partialUpdate(@PathVariable(name="id")Long id, @RequestBody Map<String,Object> request){
		boolean existeUsuario= usuarioRepository.findById(id).isPresent();
		if(existeUsuario) {
			Usuario usuario = usuarioRepository.findById(id).orElseThrow();
			
			if(request.containsKey("nombre")) {
				usuario.setNombre((String)request.get("nombre"));
			}
			
			if(request.containsKey("email")) {
				usuario.setEmail((String)request.get("email"));
			}
			
			return ResponseEntity.status(HttpStatus.OK).body(usuarioRepository.save(usuario));
			
		}
		return ResponseEntity.status(HttpStatus.NOT_FOUND).build();
	}
	
	
}
