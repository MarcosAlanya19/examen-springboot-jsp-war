<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.examen.forge.config.AppConfig" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Detalle de la canción</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
</head>
<body>
  <div class="container mt-5">
    <div class="card">
      <div class="card-body">
        <h1 class="card-title text-center mb-4"><strong><c:out value="${song.title.toUpperCase()}" /></strong></h1>
        <h4 class="card-subtitle text-muted mb-3">Creado por <c:out value="${creator.name}" /></h4>
        <p class="card-text"><strong>Género:</strong> <c:out value="${song.genre}" /></p>
        <p class="card-text"><strong>Letra:</strong></p>
        <pre class="card-text"><c:out value="${song.lyrics}" /></pre>


        <h3 class="mt-4">Contribuyentes:</h3>
        <ul class="list-group">
          <c:forEach items="${song.users}" var="userSong">
            <li class="list-group-item"><c:out value="${userSong.user.name}" /> - <c:out value="${userSong.count}" /></li>
          </c:forEach>
        </ul>

        <div class="mt-4 d-flex justify-content-between">
          <a href="/${AppConfig.ROUTE_HOME}" class="btn btn-outline-primary">Regresar a inicio</a>
          <c:if test="${isRegistration}">
            <a href="/${AppConfig.ROUTE_INDEX_SONG}/${song.id}/edit" class="btn btn-primary">Contribuir</a>
          </c:if>
        </div>
      </div>
    </div>
  </div>

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
</body>
</html>
