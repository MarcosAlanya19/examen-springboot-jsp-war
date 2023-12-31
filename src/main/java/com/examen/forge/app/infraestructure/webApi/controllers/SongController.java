package com.examen.forge.app.infraestructure.webApi.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.examen.forge.app.application.services.SongService;
import com.examen.forge.app.application.services.UserService;
import com.examen.forge.app.application.services.manyToMany.UserSongService;
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

  @Autowired
  UserSongService userSongService;

  // Registro de una cancion
  @GetMapping({ AppConfig.ROUTE_ADD_SONG })
  public String pageAddSong(@ModelAttribute(AppConfig.MA_SONG) SongEntity song) {
    return AppConfig.JSP_ADD_SONG;
  }

  @PostMapping({ AppConfig.POST_CREATE_SONG })
  public String newSong(
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
  public String songDetail(
      @PathVariable Long id, Model model, HttpSession session) {

    SongEntity song = songService.getById(id);
    model.addAttribute("song", song);
    Long userId = (Long) session.getAttribute(AppConfig.SESSION_USER);

    boolean isRegistration = userId != null;
    model.addAttribute("isRegistration", isRegistration);

    if (song != null) {
      UserEntity creator = song.getCreator();
      model.addAttribute("creator", creator);

      if (userId != null) {
        model.addAttribute("userIdInSession", userId);
      }
    }

    return AppConfig.JSP_DETAIL_SONG;
  }

  // Contribuir Cancion
  @GetMapping({ AppConfig.ROUTE_INDEX_SONG + "/{id}/edit" })
  public String songEdit(
      @PathVariable Long id, Model model, HttpSession session) {
    SongEntity song = songService.getById(id);
    model.addAttribute(AppConfig.MA_SONG, song);
    Long userId = (Long) session.getAttribute(AppConfig.SESSION_USER);

    if (userId == null) {
      return "redirect:/";
    }

    if (song != null) {
      UserEntity user = song.getCreator();
      model.addAttribute(AppConfig.MA_USER, user);

      boolean isCreator = userId != null && userId == song.getCreator().getId();
      model.addAttribute("isCreator", isCreator);

      if (!isCreator) {
        model.addAttribute("lyrics", song.getLyrics());
        song.setLyrics("");
      }
    }

    return AppConfig.JSP_EDIT_SONG;
  }

  @PostMapping({ AppConfig.POST_INDEX_SONG + "/{id}/edit" })
  public String songUpdate(
      @Valid @PathVariable Long id, @ModelAttribute(AppConfig.MA_SONG) SongEntity updatedSong,
      HttpSession session, BindingResult result, Model model) {

    if (result.hasErrors()) {
      return AppConfig.ROUTE_INDEX_SONG + "/" + id + "/edit";
    }

    SongEntity song = songService.getById(id);
    Long userId = (Long) session.getAttribute(AppConfig.SESSION_USER);

    if (song != null) {
      song.setCount(song.getCount() + 1);
      song.setTitle(updatedSong.getTitle());
      song.setGenre(updatedSong.getGenre());

      UserEntity user = userService.getById(userId);
      UserEntity songCreator = song.getCreator();

      if (user != null && user.equals(songCreator)) {
        song.setLyrics(updatedSong.getLyrics());
      } else if (updatedSong.getLyrics() != null) {
        String updatedLyrics = song.getLyrics() + " " + updatedSong.getLyrics();
        song.setLyrics(updatedLyrics.trim());
      }

      songService.create(song);
      userSongService.createUserSongRelation(user, song);
    }

    return "redirect:/" + AppConfig.ROUTE_INDEX_SONG + "/" + id + "/detail";
  }

  // Eliminar cancion
  @PostMapping({ AppConfig.POST_INDEX_SONG + "/{id}/delete" })
  public String songDelete(
      @PathVariable Long id, HttpSession session) {
    SongEntity song = songService.getById(id);
    Long userId = (Long) session.getAttribute(AppConfig.SESSION_USER);

    if (userId != null) {
      boolean isCreator = userId != null && userId == song.getCreator().getId();

      if (isCreator) {
        songService.deleteById(id);
        return "redirect:/" + AppConfig.ROUTE_HOME;
      }

      return "redirect:/" + AppConfig.ROUTE_INDEX_SONG + "/" + id + "/edit";

    } else {
      return "redirect:/";
    }
  }
}
