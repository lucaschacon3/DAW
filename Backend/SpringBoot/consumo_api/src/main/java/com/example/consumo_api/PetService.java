package com.example.consumo_api;

import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

@Service
public class PetService {
    
    private final RestTemplate restTemplate;

    public PetService(RestTemplate restTemplate) {
        this.restTemplate = restTemplate;
    }
    
    private final String PETSTORE_URL = "http://petstore-demo-endpoint.execute-api.com/petstore/pets";

    public String getPets() {
        return restTemplate.getForObject(PETSTORE_URL, String.class);
    }
}
