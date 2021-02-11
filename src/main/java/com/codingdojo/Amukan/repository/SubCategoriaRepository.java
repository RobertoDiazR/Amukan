package com.codingdojo.Amukan.repository;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.codingdojo.Amukan.models.SubCategoria;

@Repository
public interface SubCategoriaRepository extends CrudRepository<SubCategoria, Long> {
	List<SubCategoria> findAllByOrderByNombreAsc();
}
