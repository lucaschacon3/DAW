package com.example.consumo_api;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestClient;
import java.util.Map;

@Service
public class PersonajesService {
    private final RestClient restClient;

    public PersonajesService(RestClient restClient) {
        this.restClient = restClient;
    }

    // Método GET: Obtiene la lista de personajes
    public String getData() {
        return restClient.get()
                .uri("/personajes")
                .retrieve()
                .body(String.class);
    }

    // Método POST: Agrega un nuevo personaje
    public ResponseEntity<String> addPersonaje(Map<String, Object> personaje) {
        return restClient.post()
                .uri("/personajes")
                .body(personaje)
                .retrieve()
                .toEntity(String.class);
    }

    // Método PUT: Modifica un personaje existente por ID
    public ResponseEntity<String> updatePersonaje(Long id, Map<String, Object> personaje) {
        return restClient.put()
                .uri("/personajes/{id}", id)
                .body(personaje)
                .retrieve()
                .toEntity(String.class);
    }

    // Método DELETE: Elimina un personaje por ID
    public ResponseEntity<String> deletePersonaje(Long id) {
        return restClient.delete()
                .uri("/personajes/{id}", id)
                .retrieve()
                .toEntity(String.class);
    }
}
