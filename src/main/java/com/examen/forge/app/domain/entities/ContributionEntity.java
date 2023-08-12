package com.examen.forge.app.domain.entities;

import com.examen.forge.app.infraestructure.shared.BaseEntity;

import jakarta.persistence.Entity;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Table(name = "contribution")
@Getter
@Setter
@NoArgsConstructor
public class ContributionEntity extends BaseEntity {
  @ManyToOne
  @JoinColumn(name = "contributor_user_id")
  private UserEntity contributingUser;

  @ManyToOne
  @JoinColumn(name = "song_id")
  private SongEntity song;
}
