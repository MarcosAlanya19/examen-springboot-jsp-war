<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page import="com.examen.forge.config.AppConfig" %>

<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Examen - Registro</title>
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"
      crossorigin="anonymous"
    />
  </head>
  <body>
    <div class="container mt-5">
      <h1 class="mb-4">Registro!</h1>

      <form:form method="POST" action="${pageContext.request.contextPath}/${AppConfig.POST_CREATE_USER}" modelAttribute="${AppConfig.MA_USER}" class="needs-validation">
        <div class="mb-4">
          <form:label path="name" class="form-label">Nombre:</form:label>
          <form:input type="text" path="name" class="form-control" />
          <form:errors path="name" cssClass="text-danger" />
        </div>

        <div class="mb-4">
          <form:label path="email">Email:</form:label>
          <form:input type="text" path="email" class="form-control" />
          <form:errors path="email" cssClass="text-danger" />
          <c:if test="${not empty errorMessage}">
            <p class="text-danger">${errorMessage}</p>
          </c:if>
        </div>

        <div class="mb-4">
          <form:label path="password">Contraseña:</form:label>
          <form:password path="password" class="form-control" />
          <form:errors path="password" cssClass="text-danger" />
        </div>

        <div class="mb-4">
          <form:label path="confirm">Confirmar contraseña:</form:label>
          <form:password path="confirm" class="form-control" />
          <form:errors path="confirm" cssClass="text-danger" />
        </div>

        <form:errors cssClass="text-danger" />

        <input type="submit" value="Register!" class="btn btn-primary" />
      </form:form>
      Si ya tienes cuenta: <a href="/${AppConfig.ROUTE_HOME}" class="mt-3">Ingresa</a>
    </div>

    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
      crossorigin="anonymous"
    ></script>
  </body>
</html>
