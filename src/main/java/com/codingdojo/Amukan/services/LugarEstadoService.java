package com.codingdojo.Amukan.services;

import java.util.Optional;

import org.springframework.stereotype.Service;

import com.codingdojo.Amukan.models.LugarEstado;
import com.codingdojo.Amukan.repository.LugarEstadoRepository;

@Service
public class LugarEstadoService {
	private final LugarEstadoRepository lugarEstadoRepository;
	
	public LugarEstadoService(LugarEstadoRepository lugarEstadoRepository) {
		this.lugarEstadoRepository = lugarEstadoRepository;
	}
	
	public LugarEstado newLugarEstado(LugarEstado b) {
		return lugarEstadoRepository.save(b);
	}
	
	public LugarEstado findLugarEstado(Long id) {
		Optional<LugarEstado> le = lugarEstadoRepository.findById(id);
		if(le.isPresent()) {
			return le.get();
		}else {
			return null;
		}
	}
}
