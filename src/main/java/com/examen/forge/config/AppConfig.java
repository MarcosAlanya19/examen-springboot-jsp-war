package com.examen.forge.config;

import org.springframework.stereotype.Component;

@Component
public class AppConfig {
  /* ----------------------------- Rutas creadas ----------------------------- */
  public static final String ROUTE_INDEX_SONG = "song";
  public static final String ROUTE_HOME = "home";
  public static final String ROUTE_LOGOUT_USER = "logout";
  public static final String ROUTE_REGISTRATION = "registration";
  public static final String ROUTE_ADD_SONG = "song/new";

  /* ------------------------------ Archivos JSP ----------------------------- */
  public static final String JSP_LOGIN = "index.jsp";
  public static final String JSP_HOME = "home-page.jsp";
  public static final String JSP_REGISTRATION = "new-user-page.jsp";

  public static final String JSP_ADD_SONG = "new-song-page.jsp";
  public static final String JSP_EDIT_SONG = "edit-song-page.jsp";
  public static final String JSP_DETAIL_SONG = "detail-song-page.jsp";

  /* ----------------------------- Creacion POST ----------------------------- */
  /* USER */
  public static final String POST_LOGIN_USER = "user/login";
  public static final String POST_CREATE_USER = "user/create";

  /* SONG */
  public static final String POST_INDEX_SONG = "song";
  public static final String POST_CREATE_SONG = "song/create";

  /* ------------------------ ModelAttributes creados ------------------------ */
  public static final String MA_USER = "user";
  public static final String MA_SONG = "song";

  /* ------------------------------- SESSION --------------------------------- */
  public static final String SESSION_USER = "userId";
}
