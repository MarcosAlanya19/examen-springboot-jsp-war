package com.examen.forge.app.domain.repositories;

import com.examen.forge.app.domain.entities.SongEntity;
import com.examen.forge.app.infraestructure.shared.BaseRepository;

public interface SongRepository extends BaseRepository<SongEntity> {
  SongEntity findByTitle(String title);
}
