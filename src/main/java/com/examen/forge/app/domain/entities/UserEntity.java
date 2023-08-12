package com.examen.forge.app.domain.entities;

import java.util.List;

import com.examen.forge.app.infraestructure.shared.BaseEntity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.OneToMany;
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

  @OneToMany(mappedBy = "creatorUser")
  private List<SongEntity> createdSongs;

  @OneToMany(mappedBy = "contributingUser")
  private List<ContributionEntity> contributions;
}
