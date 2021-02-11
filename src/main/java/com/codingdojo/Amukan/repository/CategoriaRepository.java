package com.codingdojo.Amukan.repository;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.codingdojo.Amukan.models.Categoria;

@Repository
public interface CategoriaRepository extends CrudRepository<Categoria, Long> {
	List<Categoria> findAll();
}
