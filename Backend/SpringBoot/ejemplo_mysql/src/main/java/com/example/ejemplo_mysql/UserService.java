package com.example.ejemplo_mysql;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class UserService {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private PuntuacionRepository puntuacionRepository;

    public List<User> getAllUsers() {
        return userRepository.findAll();
    }

    public User saveUser(User user) {
        return userRepository.save(user);
    }

    public void addPuntuacion(Long userId, int puntos) {
        User user = userRepository.findById(userId).orElse(null);
        if (user != null) {
            Puntuacion puntuacion = new Puntuacion(puntos, user);
            puntuacionRepository.save(puntuacion);
        }
    }
}
