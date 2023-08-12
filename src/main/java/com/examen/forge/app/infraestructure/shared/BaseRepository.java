package com.examen.forge.app.infraestructure.shared;

import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.NoRepositoryBean;

@NoRepositoryBean
public abstract interface BaseRepository<T> extends CrudRepository<T, Long> { }
