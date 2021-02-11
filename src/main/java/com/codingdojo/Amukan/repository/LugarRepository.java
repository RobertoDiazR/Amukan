package com.codingdojo.Amukan.repository;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.codingdojo.Amukan.models.Lugar;

@Repository
public interface LugarRepository extends CrudRepository<Lugar, Long> {
	List<Lugar> findAll();
	List<Lugar> findByComuna_IdAndLugarEstado_Id(Long comuna_id , Long estado_id);
	List<Lugar> findByUser_Id(Long user_id);
	List<Lugar> findByLugarEstado_Id(Long estado_id);
}
