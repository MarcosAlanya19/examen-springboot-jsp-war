package com.examen.forge.app.domain.repositories.manyToMany;

import com.examen.forge.app.domain.entities.SongEntity;
import com.examen.forge.app.domain.entities.UserEntity;
import com.examen.forge.app.domain.entities.manyToMany.UserSongEntity;
import com.examen.forge.app.infraestructure.shared.BaseRepository;

public interface UserSongRepository extends BaseRepository<UserSongEntity> {
  UserSongEntity findByUserAndSong(UserEntity user, SongEntity song);
}
