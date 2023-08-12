<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.examen.forge.config.AppConfig" %>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Examen - Inicio</title>
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"
      crossorigin="anonymous"
    />
  </head>
  <body>
    <div class="container mt-5">
      <a href="/${AppConfig.ROUTE_LOGOUT_USER}" class="btn btn-outline-primary">Logout</a>
      <h1 class="mt-4">Hola, <c:out value="${user.name}" />. Bienvenido a la página de inicio</h1>
      <c:if test="${empty songs}">
        <p class="mt-3">No hay canciones registradas.</p>
      </c:if>

      <c:if test="${not empty songs}">
        <table class="table mt-3">
          <thead>
            <tr>
              <th>Canción</th>
              <th># de Colaboraciones</th>
            </tr>
          </thead>
          <tbody>
            <c:forEach items="${songs}" var="song">
              <tr>
                <td>
                  <a href="${AppConfig.ROUTE_DETAIL_SONG}/${song.id}">
                    <c:out value="${song.title}" />
                  </a>
                  Género: <c:out value="${song.genre}" />
                </td>
                <td><c:out value="${song.contributions.size()}" /></td>
              </tr>
            </c:forEach>
          </tbody>
        </table>
      </c:if>
      <a href="/${AppConfig.ROUTE_ADD_SONG}" class="btn btn-primary mt-3">Nueva canción</a>
    </div>

    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
      crossorigin="anonymous"
    ></script>
  </body>
</html>
