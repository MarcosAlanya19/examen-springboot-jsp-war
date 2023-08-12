<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %> <%@ taglib prefix="form"
uri="http://www.springframework.org/tags/form" %> <%@ page import="com.examen.forge.config.AppConfig" %>

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
      <h1 class="mb-4">Register!</h1>

      <form:form method="POST" action="${AppConfig.POST_CREATE_USER}" modelAttribute="${AppConfig.MA_USER}" class="needs-validation">
        <div class="form-outline mb-4">
          <form:label path="name" class="form-label">Name:</form:label>
          <form:input type="text" path="name" class="form-control" />
          <form:errors path="name" cssClass="error" />
        </div>

        <div class="form-outline mb-4">
          <form:label path="email">Email:</form:label>
          <form:input type="text" path="email" />
          <form:errors path="email" cssClass="error" />
          <c:if test="${not empty errorMessage}">
            <p style="color: red">${errorMessage}</p>
          </c:if>
        </div>

        <div class="form-outline mb-4">
          <form:label path="password">Password:</form:label>
          <form:password path="password" />
          <form:errors path="password" cssClass="error" />
        </div>

        <div class="form-outline mb-4">
          <form:label path="confirm">Password Confirmation:</form:label>
          <form:password path="confirm" />
          <form:errors path="confirm" cssClass="error" />
        </div>

        <form:errors cssClass="global-error" />

        <input type="submit" value="Register!" />
      </form:form>
      <a href="${AppConfig.ROUTE_HOME}">Ingresa</a>
    </div>

    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
      crossorigin="anonymous"
    ></script>
  </body>
</html>
