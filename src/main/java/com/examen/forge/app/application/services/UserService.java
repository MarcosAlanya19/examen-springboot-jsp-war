package com.examen.forge.app.application.services;

import java.util.Optional;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.examen.forge.app.domain.entities.UserEntity;
import com.examen.forge.app.domain.repositories.UserRepository;

@Service
public class UserService {
  @Autowired
  UserRepository userRepository;

  // Guardar usuario con contraseña hasheada
  public UserEntity create(UserEntity user) {
    String hashed = BCrypt.hashpw(user.getPassword(), BCrypt.gensalt());
    user.setPassword(hashed);
    return userRepository.save(user);
  }

  // Buscar usuario mendiante email
  public UserEntity findByEmail(String email) {
    return userRepository.findByEmail(email);
  }

  // Encontrar usuario mediante id
  public UserEntity getById(Long id) {
    Optional<UserEntity> u = userRepository.findById(id);

    if (u.isPresent()) {
      return u.get();
    } else {
      return null;
    }
  }

  // Autentificacion de usuario
  public boolean authenticateUser(String email, String password) {
    UserEntity user = userRepository.findByEmail(email);
    if (user == null) {
      return false;
    } else {
      if (BCrypt.checkpw(password, user.getPassword())) {
        return true;
      } else {
        return false;
      }
    }
  }
}
