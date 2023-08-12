package com.examen.forge.app.domain.entities;

import java.util.HashSet;
import java.util.Set;

import com.examen.forge.app.infraestructure.shared.BaseEntity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.JoinTable;
import jakarta.persistence.ManyToMany;
import jakarta.persistence.ManyToOne;
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
  @Column(unique = true)
  private String title;

  @NotNull(message = "El genero no puede estar vacia")
  @NotBlank(message = "El genero no puede estar vacia")
  private String genre;

  @NotNull(message = "La letra no puede estar vacia")
  @NotBlank(message = "La letra no puede estar vacia")
  @Size(min = 5, message = "La letra debe tener como minimo 5 caracteres")
  private String lyrics;

  @ManyToOne
  @JoinColumn(name = "creator_user_id")
  private UserEntity creatorUser;

  @ManyToMany
  @JoinTable(name = "song_contributor", joinColumns = @JoinColumn(name = "song_id"), inverseJoinColumns = @JoinColumn(name = "contributor_user_id"))
  private Set<UserEntity> contributors = new HashSet<>();
}
