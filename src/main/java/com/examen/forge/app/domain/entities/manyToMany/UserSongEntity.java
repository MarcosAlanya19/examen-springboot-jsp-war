package com.examen.forge.app.domain.entities.manyToMany;

import org.hibernate.annotations.OnDelete;
import org.hibernate.annotations.OnDeleteAction;

import com.examen.forge.app.domain.entities.SongEntity;
import com.examen.forge.app.domain.entities.UserEntity;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Table(name = "user_song")
@Getter
@Setter
@NoArgsConstructor
public class UserSongEntity {
  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  private Long id;

  @ManyToOne
  @JoinColumn(name = "user_id")
  @OnDelete(action = OnDeleteAction.CASCADE)
  private UserEntity user;

  @ManyToOne
  @JoinColumn(name = "song_id")
  @OnDelete(action = OnDeleteAction.CASCADE)
  private SongEntity song;

  private Integer count = 0;
}
