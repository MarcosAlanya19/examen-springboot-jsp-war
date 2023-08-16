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
  public String pageAddSong(@ModelAttribute(AppConfig.MA_SONG) SongEntity song) {
    return AppConfig.JSP_ADD_SONG;
  }

  @PostMapping({ AppConfig.POST_CREATE_SONG })
  public String newCandidate(
      @Valid @ModelAttribute(AppConfig.MA_SONG) SongEntity song, BindingResult result,
      HttpSession session, Model model) {

    if (result.hasErrors()) {
      model.addAttribute("globalErrors", result.getGlobalErrors());
      return AppConfig.JSP_ADD_SONG;
    }

    if (songService.getByTitle(song.getTitle()) != null) {
      model.addAttribute("errorMessage", "El nombre ya está en uso.");
      return AppConfig.JSP_ADD_SONG;
    }

    Long userId = (Long) session.getAttribute(AppConfig.SESSION_USER);
    UserEntity user = userService.getById(userId);

    if (user != null) {
      song.setCreator(user);
      songService.create(song);
    }
    return "redirect:/" + AppConfig.ROUTE_HOME;
  }

  // Detalle de cancion por id
  @GetMapping({ AppConfig.ROUTE_INDEX_SONG + "/{id}/detail" })
  public String candidateDetail(
      @PathVariable Long id, Model model, HttpSession session) {
    SongEntity song = songService.getById(id);
    model.addAttribute("song", song);

    if (song != null) {
      UserEntity user = song.getCreator();
      model.addAttribute("user", user);

      Long userId = (Long) session.getAttribute(AppConfig.SESSION_USER);
      if (userId != null) {
        model.addAttribute("userIdInSession", userId);
      }
    }

    return AppConfig.JSP_DETAIL_SONG;
  }

  // Contribuir Cancion
  @GetMapping({ AppConfig.ROUTE_INDEX_SONG + "/{id}/edit" })
  public String editCandidate(
      @PathVariable Long id, Model model, HttpSession session) {
    SongEntity song = songService.getById(id);
    model.addAttribute(AppConfig.MA_SONG, song);

    if (song != null) {
      UserEntity user = song.getCreator();
      model.addAttribute(AppConfig.MA_USER, user);

      Long userId = (Long) session.getAttribute(AppConfig.SESSION_USER);
      if (userId != null) {
        model.addAttribute("userIdInSession", userId);
      }
    }

    return AppConfig.JSP_EDIT_SONG;
  }

  @PostMapping({ AppConfig.POST_INDEX_SONG + "/{id}/edit" })
  public String updateSong(
      @PathVariable Long id, @ModelAttribute SongEntity updatedSong, HttpSession session) {
    SongEntity song = songService.getById(id);
    Long userId = (Long) session.getAttribute(AppConfig.SESSION_USER);
    UserEntity user = userService.getById(userId);

    if (song != null) {
      song.setTitle(updatedSong.getTitle());
      song.setGenre(updatedSong.getGenre());
      song.setLyrics(updatedSong.getLyrics());

      song.getUsers().add(user);

      song.setCount(updatedSong.getCount() + 1);
      songService.create(song);
    }

    return "redirect:/" + AppConfig.ROUTE_INDEX_SONG + "/" + id + "/detail";
  }

  @PostMapping({ AppConfig.POST_INDEX_SONG + "/{id}/delete" })
  public String deleteSong(@PathVariable Long id) {
    songService.deleteById(id);
    return "redirect:/" + AppConfig.ROUTE_HOME;
  }
}
