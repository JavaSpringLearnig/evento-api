package com.welitonmartins.repository;

import org.springframework.data.repository.CrudRepository;

import com.welitonmartins.models.Usuario;

public interface UsuarioRepository extends CrudRepository<Usuario, String>{
	Usuario findByLogin(String login);
}
