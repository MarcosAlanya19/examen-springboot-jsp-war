<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> <%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %> <%@ page
import="com.examen.forge.config.AppConfig" %>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Examen - Inicio</title>
  </head>
  <body>
    <a href="/${AppConfig.ROUTE_LOGOUT_USER}">Logout</a>
    <h1>Hola, <c:out value="${user.name}" />. bienvenido a la pagina de inicio</h1>
    <c:if test="${empty songs}">
      <p>No hay canciones registradas.</p>
    </c:if>

    <c:if test="${not empty songs}">
      <table>
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
                Genero:<c:out value="${song.genre}" />
              </td>
              <!-- <td><c:out value="${candidate.votes.size()}" /></td> -->
            </tr>
          </c:forEach>
        </tbody>
      </table>
    </c:if>
    <a href="/${AppConfig.ROUTE_ADD_SONG}">New name</a>
  </body>
</html>
