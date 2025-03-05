package ies.goya.examen.ud5.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import ies.goya.examen.ud5.model.Email;

@Repository
public interface EmailRepository extends JpaRepository<Email,Long>{

	List<Email> findAllByOrderByAlumnoNombreDesc();
	List<Email> findAllByOrderByAlumnoApellidosDesc();
	List<Email> findAllById(Long id);
}
