package com.examen.forge.app.application.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.examen.forge.app.domain.entities.SongEntity;
import com.examen.forge.app.domain.repositories.SongRepository;

@Service
public class SongService {
  @Autowired
  SongRepository songRepository;

  public List<SongEntity> getAll() {
    return (List<SongEntity>) songRepository.findAll();
  }

  public SongEntity create(SongEntity candidate) {
    return songRepository.save(candidate);
  }

  public SongEntity getById(Long id) {
    Optional<SongEntity> candidate = songRepository.findById(id);
    return candidate.orElse(null);
  }

  public void deleteById(Long id) {
    songRepository.deleteById(id);
  }
}
