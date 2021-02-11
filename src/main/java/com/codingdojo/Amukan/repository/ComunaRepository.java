package com.codingdojo.Amukan.repository;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.codingdojo.Amukan.models.Comuna;

@Repository
public interface ComunaRepository extends CrudRepository<Comuna, Long>{
	List<Comuna> findAllByOrderByNombreAsc();

}
