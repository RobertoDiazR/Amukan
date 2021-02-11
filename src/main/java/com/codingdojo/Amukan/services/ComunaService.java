package com.codingdojo.Amukan.services;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.codingdojo.Amukan.models.Comuna;
import com.codingdojo.Amukan.repository.ComunaRepository;

@Service
public class ComunaService {
	private final ComunaRepository comunaRepository;
	public ComunaService(ComunaRepository comunaRepository) {
		this.comunaRepository = comunaRepository;
	}
	public Comuna newComuna(Comuna b) {
		return comunaRepository.save(b);
	}
	public List<Comuna> allComunas(){
		return comunaRepository.findAllByOrderByNombreAsc();
	}
	public Comuna findComuna(Long id) {
		Optional<Comuna> c = comunaRepository.findById(id);
		if(c.isPresent()) {
			return c.get();
		}else {
			return null;
		}
	}

}
