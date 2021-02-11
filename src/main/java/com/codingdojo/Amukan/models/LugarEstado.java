package com.codingdojo.Amukan.models;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="estados_lugares")
public class LugarEstado {
	@Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    private Long id;
	private String nombre;
	@OneToMany(mappedBy="lugarEstado", fetch = FetchType.LAZY)
    private List<Lugar> Lugares;
	
	public LugarEstado() {
		
	}
	
	public LugarEstado(String nombre) {
		this.nombre = nombre;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public List<Lugar> getLugares() {
		return Lugares;
	}

	public void setLugares(List<Lugar> lugares) {
		Lugares = lugares;
	}
	
}
