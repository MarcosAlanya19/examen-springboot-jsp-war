package com.examen.forge.app.application.services.manyToMany;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.examen.forge.app.domain.entities.SongEntity;
import com.examen.forge.app.domain.entities.UserEntity;
import com.examen.forge.app.domain.entities.manyToMany.UserSongEntity;
import com.examen.forge.app.domain.repositories.manyToMany.UserSongRepository;
import com.examen.forge.app.infraestructure.shared.BaseService;

@Service
public class UserSongService extends BaseService<UserSongEntity> {
  @Autowired
  private UserSongRepository userSongRepository;

  public void createUserSongRelation(UserEntity user, SongEntity song) {
    UserSongEntity userSongRelation = userSongRepository.findByUserAndSong(user, song);

    if (userSongRelation != null) {
      userSongRelation.setCount(userSongRelation.getCount() + 1);
    } else {
      userSongRelation = new UserSongEntity();
      userSongRelation.setUser(user);
      userSongRelation.setSong(song);
      userSongRelation.setCount(1);
    }

    userSongRepository.save(userSongRelation);
  }
}
