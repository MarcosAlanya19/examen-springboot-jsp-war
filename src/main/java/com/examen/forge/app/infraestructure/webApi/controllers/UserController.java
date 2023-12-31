package com.examen.forge.app.infraestructure.webApi.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.examen.forge.app.application.services.SongService;
import com.examen.forge.app.application.services.UserService;
import com.examen.forge.app.domain.entities.SongEntity;
import com.examen.forge.app.domain.entities.UserEntity;
import com.examen.forge.config.AppConfig;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
public class UserController {
  @Autowired
  UserService userService;

  @Autowired
  SongService songService;

  // Registro de usuario
  @GetMapping({ AppConfig.ROUTE_REGISTRATION })
  public String pageRegister(@ModelAttribute(AppConfig.MA_USER) UserEntity user) {
    return AppConfig.JSP_REGISTRATION;
  }

  @PostMapping({ AppConfig.POST_CREATE_USER })
  public String newUser(
      @Valid @ModelAttribute(AppConfig.MA_USER) UserEntity user, BindingResult result,
      HttpSession session, Model model) {

    if (result.hasErrors()) {
      model.addAttribute("globalErrors", result.getGlobalErrors());
      return AppConfig.JSP_REGISTRATION;
    }

    if (userService.existsByEmail(user.getEmail())) {
      model.addAttribute("emailError", "El email ya está en uso");
      return AppConfig.JSP_REGISTRATION;
    }

    if (!user.getPassword().equals(user.getConfirm())) {
      model.addAttribute("confirmError", "Las contraseñas no coinciden");
      return AppConfig.JSP_REGISTRATION;
    }

    UserEntity newUser = userService.create(user);
    session.setAttribute(AppConfig.SESSION_USER, newUser.getId());
    return "redirect:/" + AppConfig.ROUTE_HOME;
  }

  // Logueo de usuario
  @GetMapping
  public String pageLogin() {

    return AppConfig.JSP_LOGIN;
  }

  @PostMapping({ AppConfig.POST_LOGIN_USER })
  public String loginUser(@ModelAttribute UserEntity user, Model model, HttpSession session) {
    String email = user.getEmail();
    String password = user.getPassword();

    if (email.trim().isEmpty()) {
      model.addAttribute("errorEmail", "El correo no puede estar vacia.");
      return AppConfig.JSP_LOGIN;
    }

    if (password.trim().isEmpty()) {
      model.addAttribute("errorPassword", "La contraseña no puede estar vacia.");
      return AppConfig.JSP_LOGIN;
    }

    if (userService.authenticateUser(email, password)) {
      UserEntity userByEmail = userService.getByEmail(email);
      session.setAttribute(AppConfig.SESSION_USER, userByEmail.getId());
      return "redirect:/" + AppConfig.ROUTE_HOME;
    } else {
      model.addAttribute("error", "Credenciales no válidas. Inténtalo de nuevo.");
      return AppConfig.JSP_LOGIN;
    }
  }

  // Redireccion a home
  @GetMapping({ AppConfig.ROUTE_HOME })
  public String pageHome(HttpSession session, Model model) {
    Long userId = (Long) session.getAttribute(AppConfig.SESSION_USER);
    List<SongEntity> songs = songService.getAll();
    model.addAttribute("songs", songs);

    boolean isRegistration = userId != null;
    model.addAttribute("isRegistration", isRegistration);

    if (userId != null) {
      UserEntity user = userService.getById(userId);
      model.addAttribute(AppConfig.MA_USER, user);
    }

    return AppConfig.JSP_HOME;
  }

  // Eliminacion de session
  @GetMapping("logout")
  public String logoutUser(HttpSession session) {
    session.removeAttribute(AppConfig.SESSION_USER);
    return "redirect:/";
  }
}
