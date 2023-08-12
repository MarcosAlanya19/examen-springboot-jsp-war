package com.examen.forge.app.application.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.examen.forge.app.domain.entities.ContributionEntity;
import com.examen.forge.app.domain.repositories.ContributionRepository;

@Service
public class ContributionService {
  @Autowired
  private ContributionRepository contributionRepository;

  public void create(ContributionEntity contribution) {
    contributionRepository.save(contribution);
  }
}
