package com.codingdojo.Amukan.services;

import java.util.List;

import org.springframework.stereotype.Service;

import com.codingdojo.Amukan.models.SubCategoria;
import com.codingdojo.Amukan.repository.SubCategoriaRepository;

@Service
public class SubCategoriaService {
	private final SubCategoriaRepository subCategoriaRepository;
	public SubCategoriaService(SubCategoriaRepository subCategoriaRepository) {
		this.subCategoriaRepository = subCategoriaRepository;
	}
	public SubCategoria newSubCategoria(SubCategoria b) {
		return subCategoriaRepository.save(b);
	}
	public List<SubCategoria> allSubCategoria(){
		return subCategoriaRepository.findAllByOrderByNombreAsc();
	}
}
