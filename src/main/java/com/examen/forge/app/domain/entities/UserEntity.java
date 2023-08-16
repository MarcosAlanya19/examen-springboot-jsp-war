package com.examen.forge.app.domain.entities;

import java.util.HashSet;
import java.util.Set;

import com.examen.forge.app.infraestructure.shared.BaseEntity;
import com.fasterxml.jackson.annotation.JsonIgnore;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.JoinTable;
import jakarta.persistence.ManyToMany;
import jakarta.persistence.Table;
import jakarta.persistence.Transient;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Table(name = "user")
@Getter
@Setter
@NoArgsConstructor
public class UserEntity extends BaseEntity {
  @NotNull(message = "El correo electrónico no puede ser nulo")
  @NotBlank(message = "El correo electrónico no puede ser nulo")
  @Size(min = 5, message = "El nombre debe tener más de 5 caracteres")
  private String name;

  @NotNull(message = "El correo electrónico no puede ser nulo")
  @NotBlank(message = "El correo electrónico no puede ser nulo")
  @Email(message = "El email debe ser válido")
  @Column(unique = true)
  private String email;

  @Size(min = 5, message = "La contraseña debe tener más de 5 caracteres")
  private String password;

  @Transient
  @NotNull(message = "La confirmación de contraseña no puede ser nula")
  @Size(min = 5, message = "La confirmación de contraseña debe tener más de 5 caracteres")
  private String confirm;

  @ManyToMany(fetch = FetchType.LAZY)
  @JsonIgnore
  @JoinTable(name = "user_song", joinColumns = @JoinColumn(name = "user_id"), inverseJoinColumns = @JoinColumn(name = "song_id"))
  private Set<SongEntity> songs = new HashSet<>();
}
