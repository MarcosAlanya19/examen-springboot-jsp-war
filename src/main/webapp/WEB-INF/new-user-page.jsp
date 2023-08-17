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
    <style>
      .error {
        color: red;
      }

      .centered-container {
        display: flex;
        flex-direction: column;
        justify-content: center;
        height: 80vh;
        border-radius: 20px;
        padding: 40px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
      }
    </style>
    <div class="container-fluid">
      <div class="row justify-content-center align-items-center" style="height: 100vh">
        <div class="col-lg-4 centered-container">
          <h1 class="mb-4 text-center">Registro</h1>

          <form:form
            method="POST"
            action="${pageContext.request.contextPath}/${AppConfig.POST_CREATE_USER}"
            modelAttribute="${AppConfig.MA_USER}"
            class="needs-validation"
          >
            <div class="mb-3">
              <form:label path="name" class="form-label">Nombre:</form:label>
              <form:input type="text" path="name" class="form-control mb-1 py-3" />
              <form:errors path="name" cssClass="error" />
            </div>

            <div class="mb-3">
              <form:label path="email">Email:</form:label>
              <form:input type="text" path="email" class="form-control mb-1 py-3" />
              <form:errors path="email" cssClass="error" />
              <c:if test="${not empty emailError}">
                <p class="text-danger">${emailError}</p>
              </c:if>
            </div>

            <div class="mb-3">
              <form:label path="password">Contraseña:</form:label>
              <form:password path="password" class="form-control mb-1 py-3" />
              <form:errors path="password" cssClass="error" />
            </div>

            <div class="mb-3">
              <form:label path="confirm">Confirmar contraseña:</form:label>
              <form:password path="confirm" class="form-control mb-1 py-3" />
              <c:if test="${not empty confirmError}">
                <p class="text-danger">${confirmError}</p>
              </c:if>
            </div>

            <form:errors cssClass="text-danger" />

            <button type="submit" class="btn btn-primary w-100">Registrar</button>
          </form:form>
          <p class="mt-3">¿Ya tienes cuenta? <a href="/">Ingresa</a></p>
        </div>
      </div>
    </div>

    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
      crossorigin="anonymous"
    ></script>
  </body>
</html>
