package com.examen.forge.app.domain.repositories;

import com.examen.forge.app.domain.entities.UserEntity;
import com.examen.forge.app.infraestructure.shared.BaseRepository;

public interface UserRepository extends BaseRepository<UserEntity> {
  UserEntity findByEmail(String email);
  boolean existsByEmail(String email);
}
