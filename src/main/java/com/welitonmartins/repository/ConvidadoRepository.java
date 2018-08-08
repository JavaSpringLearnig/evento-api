package com.welitonmartins.repository;

import org.springframework.data.repository.CrudRepository;

import com.welitonmartins.models.Convidado;
import com.welitonmartins.models.Evento;

public interface ConvidadoRepository extends CrudRepository<Convidado, String>{
	Iterable<Convidado> findByEvento(Evento evento);

}
