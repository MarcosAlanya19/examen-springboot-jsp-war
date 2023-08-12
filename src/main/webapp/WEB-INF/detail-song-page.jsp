<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.examen.forge.config.AppConfig" %>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Detalle de la canción</title>
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"
      crossorigin="anonymous"
    />
  </head>
  <body>
    <div class="container mt-5">
      <h1><c:out value="${song.title}" /></h1>
      <h2>Creado por <c:out value="${user.name}" /></h2>
      <p>Género: <c:out value="${song.genre}" /></p>
      <p>Letra: <c:out value="${song.lyrics}" /></p>

      <h3 class="mt-4">Contribuyentes:</h3>
      <ul>
        <c:forEach items="${song.contributions}" var="contribution">
          <li><c:out value="${contribution.contributingUser.name}" /></li>
        </c:forEach>
      </ul>

      <a href="/${AppConfig.ROUTE_HOME}" class="btn btn-outline-primary mt-3">Regresar a inicio</a>
      <a href="/${AppConfig.ROUTE_EDIT_SONG}/${song.id}" class="btn btn-primary mt-3">Contribuir</a>
    </div>

    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
      crossorigin="anonymous"
    ></script>
  </body>
</html>
