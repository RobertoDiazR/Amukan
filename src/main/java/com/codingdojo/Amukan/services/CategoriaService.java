package com.codingdojo.Amukan.services;

import java.util.List;

import org.springframework.stereotype.Service;

import com.codingdojo.Amukan.models.Categoria;
import com.codingdojo.Amukan.repository.CategoriaRepository;

@Service
public class CategoriaService {
	private final CategoriaRepository categoriaRepository;
	public CategoriaService(CategoriaRepository categoriaRepository) {
		this.categoriaRepository = categoriaRepository;
	}
	public Categoria newCategoria(Categoria b) {
		return categoriaRepository.save(b);
	}
	public List<Categoria> allCategoria(){
		return categoriaRepository.findAll();
	}
}
