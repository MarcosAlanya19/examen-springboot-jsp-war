<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.examen.forge.config.AppConfig" %>

<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Examen - Ingreso</title>
  </head>
  <body>
    <h1>Ingreso</h1>
    <p><c:out value="${error}" /></p>
    <form method="POST" action="${AppConfig.POST_LOGIN_USER}">
      <p>
        <label for="email">Email</label>
        <input type="text" id="email" name="email" />
      </p>
      <p>
        <label for="password">Password</label>
        <input type="password" id="password" name="password" />
      </p>
      <input type="submit" value="Login!" />
    </form>
    <a href="/${AppConfig.ROUTE_REGISTRATION}">Registration</a>
  </body>
</html>
