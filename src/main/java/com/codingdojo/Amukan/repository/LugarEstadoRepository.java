package com.codingdojo.Amukan.repository;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.codingdojo.Amukan.models.LugarEstado;

@Repository
public interface LugarEstadoRepository  extends CrudRepository<LugarEstado, Long>{
	List<LugarEstado> findAll();
}
