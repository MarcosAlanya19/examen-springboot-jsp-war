package com.examen.forge.app.infraestructure.webApi.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.examen.forge.app.application.services.SongService;
import com.examen.forge.app.application.services.UserService;
import com.examen.forge.app.domain.entities.SongEntity;
import com.examen.forge.app.domain.entities.UserEntity;
import com.examen.forge.config.AppConfig;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
public class SongController {
  @Autowired
  SongService songService;

  @Autowired
  UserService userService;

  // Registro de una cancion
  @GetMapping({ AppConfig.ROUTE_ADD_SONG })
  public String pageAddCandidate(@ModelAttribute(AppConfig.MA_SONG) SongEntity song) {
    return AppConfig.JSP_ADD_SONG;
  }

  @PostMapping({ AppConfig.POST_CREATE_SONG })
  public String newCandidate(@Valid @ModelAttribute SongEntity song, BindingResult result,
      HttpSession session, Model model) {

    try {
      if (result.hasErrors()) {
        model.addAttribute("globalErrors", result.getGlobalErrors());
        return AppConfig.JSP_ADD_SONG;
      }
      Long userId = (Long) session.getAttribute(AppConfig.SESSION_USER);
      UserEntity user = userService.getById(userId);
      if (user != null) {
        song.setCreatorUser(user);
        songService.create(song);
      }
      return "redirect:/" + AppConfig.ROUTE_HOME;
    } catch (DataIntegrityViolationException ex) {
      model.addAttribute("errorMessage", "El nombre ya está en uso.");
      return AppConfig.JSP_ADD_SONG; // Devuelve la vista de creación de canciones con error específico
    }
  }

  // Detalle de cancion por id
  @GetMapping({ AppConfig.ROUTE_DETAIL_SONG + "/{id}" })
  public String candidateDetail(@PathVariable Long id, Model model, HttpSession session) {
    SongEntity song = songService.getById(id);
    model.addAttribute("song", song);

    if (song != null) {
      UserEntity user = song.getCreatorUser();
      model.addAttribute("user", user);

      Long userId = (Long) session.getAttribute(AppConfig.SESSION_USER); // Obtiene el ID del usuario de la sesión
      if (userId != null) {
        model.addAttribute("userIdInSession", userId);
      }
    }

    return AppConfig.JSP_DETAIL_SONG; // Nombre de la página de detalle
  }

  // Contribuir Cancion
  @GetMapping({ AppConfig.ROUTE_EDIT_SONG + "/{id}" })
  public String editCandidate(@PathVariable Long id, Model model) {
    SongEntity song = songService.getById(id);
    model.addAttribute(AppConfig.MA_SONG, song);

    return AppConfig.JSP_EDIT_SONG;
  }

  @PostMapping({ AppConfig.POST_EDIT_SONG + "/{id}" })
  public String updateCandidate(@PathVariable Long id, @ModelAttribute SongEntity song) {
    SongEntity existingSong = songService.getById(id);

    if (existingSong != null) {
      existingSong.setTitle(song.getTitle());
      existingSong.setGenre(song.getGenre());
      existingSong.setLyrics(song.getLyrics());

      songService.create(existingSong);
    }

    return "redirect:/" + AppConfig.ROUTE_DETAIL_SONG + "/" + id;
  }
}
