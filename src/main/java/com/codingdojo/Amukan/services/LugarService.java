package com.codingdojo.Amukan.services;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.codingdojo.Amukan.models.Lugar;
import com.codingdojo.Amukan.models.LugarEstado;
import com.codingdojo.Amukan.repository.LugarRepository;

@Service
public class LugarService {
	private final LugarRepository lugarRepository;
	public LugarService(LugarRepository lugarRepository) {
		this.lugarRepository = lugarRepository;
	}
	public Lugar createLugar(Lugar b) {
		return lugarRepository.save(b);
	}
	public Lugar findLugar(Long id) {
		Optional<Lugar> l = lugarRepository.findById(id);
		if(l.isPresent()) {
			return l.get();
		}else {
			return null;
		}
	}
	public List<Lugar> findByComuna(Long comuna_id , Long estado_id){
		return lugarRepository.findByComuna_IdAndLugarEstado_Id(comuna_id, estado_id);
	}
	public List<Lugar> findByTypeUserId(Long user_id, Long user_type_id){
		
		if(user_type_id == 2L || user_type_id == 3L ) {
			return lugarRepository.findByUser_Id(user_id);
		}else {
			return lugarRepository.findByLugarEstado_Id(1L);
		}
	}
	public List<Lugar> findByEstado(Long estado_id){
		return lugarRepository.findByLugarEstado_Id(estado_id);
	}
	
	public Lugar updateEstado(Long idLugar, LugarEstado lugarEstado) {
		this.findLugar(idLugar).setLugarEstado(lugarEstado);
		return lugarRepository.save(this.findLugar(idLugar));
	}
	
}
