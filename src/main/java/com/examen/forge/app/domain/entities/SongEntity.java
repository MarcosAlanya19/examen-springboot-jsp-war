package com.examen.forge.app.domain.entities;

import java.util.HashSet;
import java.util.Set;

import com.examen.forge.app.domain.entities.manyToMany.UserSongEntity;
import com.examen.forge.app.infraestructure.shared.BaseEntity;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Table(name = "song")
@Getter
@Setter
@NoArgsConstructor
public class SongEntity extends BaseEntity {
  @NotNull(message = "El titulo no puede estar vacio")
  @NotBlank(message = "El titulo no puede estar vacio")
  @Column(unique = true)
  private String title;

  @NotNull(message = "El genero no puede estar vacia")
  @NotBlank(message = "El genero no puede estar vacia")
  private String genre;

  @NotNull(message = "La letra no puede estar vacia")
  @NotBlank(message = "La letra no puede estar vacia")
  @Size(min = 5, message = "La letra debe tener como minimo 5 caracteres")
  @Column(columnDefinition = "TEXT")
  private String lyrics;

  private Integer count = 0;

  @ManyToOne(fetch = FetchType.LAZY)
  @JoinColumn(name = "creator_id")
  private UserEntity creator;

  @OneToMany(mappedBy = "song", cascade = CascadeType.ALL)
  private Set<UserSongEntity> users = new HashSet<>();
}
