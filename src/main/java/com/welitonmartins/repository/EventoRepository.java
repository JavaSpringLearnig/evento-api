package com.welitonmartins.repository;

import org.springframework.data.repository.CrudRepository;


import com.welitonmartins.models.Evento;

public interface EventoRepository extends CrudRepository<Evento, String>{
	Evento findByCodigo(Long codigo);
	
}
