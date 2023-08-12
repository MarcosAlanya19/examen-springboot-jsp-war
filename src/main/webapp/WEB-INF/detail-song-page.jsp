<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> <%@ page language="java"
contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %> <%@ page import="com.examen.forge.config.AppConfig" %>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Candidate Detail</title>
  </head>
  <body>
    <h1><c:out value="${song.title}" /></h1>
    <h2>Creado por <c:out value="${user.name}" /></h2>
    <p>Gender: <c:out value="${song.genre}" /></p>
    <p>Origin: <c:out value="${song.lyrics}" /></p>

    <a href="/${AppConfig.ROUTE_HOME}">Regresar a inicio</a>
    <a href="${AppConfig.ROUTE_EDIT_SONG}/${song.id}">Contribuir</a>
  </body>
</html>
