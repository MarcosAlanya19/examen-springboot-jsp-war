package com.examen.forge.app.application.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.examen.forge.app.domain.entities.SongEntity;
import com.examen.forge.app.domain.repositories.SongRepository;
import com.examen.forge.app.domain.repositories.UserRepository;
import com.examen.forge.app.infraestructure.shared.BaseService;

@Service
public class SongService extends BaseService<SongEntity> {
  @Autowired
  SongRepository songRepository;

  @Autowired
  UserRepository userRepository;

  // Buscar song por el nombre
  public SongEntity getByTitle(String title) {
    return songRepository.findByTitle(title);
  }
}
