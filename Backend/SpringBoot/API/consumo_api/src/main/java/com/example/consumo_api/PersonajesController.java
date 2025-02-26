package com.example.consumo_api;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

@RestController
@RequestMapping("/personajes")
public class PersonajesController {
    private final PersonajesService personajesService;

    public PersonajesController(PersonajesService personajesService) {
        this.personajesService = personajesService;
    }

    // Obtener la lista de personajes (GET)
    @GetMapping
    public String fetchPersonajes() {
        return personajesService.getData();
    }

    // Agregar un nuevo personaje (POST)
    @PostMapping
    public ResponseEntity<String> addPersonaje(@RequestBody Map<String, Object> personaje) {
        return personajesService.addPersonaje(personaje);
    }

    // Modificar un personaje existente (PUT)
    @PutMapping("/{id}")
    public ResponseEntity<String> updatePersonaje(@PathVariable(name="id") Long id, @RequestBody Map<String, Object> personaje) {
        return personajesService.updatePersonaje(id, personaje);
    }

    // Eliminar un personaje (DELETE)
    @DeleteMapping("/{id}")
    public ResponseEntity<String> deletePersonaje(@PathVariable(name="id") Long id) {
        return personajesService.deletePersonaje(id);
    }
}
