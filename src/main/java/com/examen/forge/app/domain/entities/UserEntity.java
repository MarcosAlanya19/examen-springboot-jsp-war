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
  @NotNull(message = "Email cannot be null")
  @NotBlank(message = "Email must not be blank")
  @Size(min = 5, message = "Name must be greater than 5 characters")
  private String name;

  @NotNull(message = "Email cannot be null")
  @NotBlank(message = "Email must not be blank")
  @Email(message = "Email must be valid")
  @Column(unique = true)
  private String email;

  @Size(min = 5, message = "Password must be greater than 5 characters")
  private String password;

  @Transient
  private String confirm;

  @OneToMany(mappedBy = "creatorUser")
  private List<SongEntity> createdSongs;

  @OneToMany(mappedBy = "contributingUser")
  private List<ContributionEntity> contributions;
}
