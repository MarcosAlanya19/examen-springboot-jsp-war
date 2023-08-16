package com.examen.forge.app.application.services;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.examen.forge.app.domain.entities.UserEntity;
import com.examen.forge.app.domain.repositories.UserRepository;
import com.examen.forge.app.infraestructure.shared.BaseService;

@Service
public class UserService extends BaseService<UserEntity> {
  @Autowired
  UserRepository userRepository;

  // Guardar usuario con contraseña hasheada
  @Override
  public UserEntity create(UserEntity user) {
    String hashed = BCrypt.hashpw(user.getPassword(), BCrypt.gensalt());
    user.setPassword(hashed);
    return userRepository.save(user);
  }

  // Buscar usuario mendiante email
  public UserEntity getByEmail(String email) {
    return userRepository.findByEmail(email);
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
