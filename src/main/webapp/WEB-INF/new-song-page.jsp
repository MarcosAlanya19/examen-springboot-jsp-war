<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page import="com.examen.forge.config.AppConfig" %>

<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Examen - Nueva cancion</title>
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"
      crossorigin="anonymous"
    />
  </head>
  <body>
    <div class="container mt-5">
      <h1>Agregar cancion!</h1>
      <form:form
        method="POST"
        action="${pageContext.request.contextPath}/${AppConfig.POST_CREATE_SONG}"
        modelAttribute="${AppConfig.MA_SONG}"
        class="needs-validation"
      >
        <div class="mb-3">
          <form:label path="title">Titulo:</form:label>
          <form:input type="text" path="title" class="form-control" />
          <form:errors path="title" cssClass="error" />
          <c:if test="${not empty errorMessage}">
            <p style="color: red">${errorMessage}</p>
          </c:if>
        </div>

        <div class="mb-3">
          <form:label path="genre">Genero:</form:label>
          <form:select path="genre" class="form-select">
            <form:option value="Rock">Rock</form:option>
            <form:option value="Cumbia">Cumbia</form:option>
            <form:option value="Pop">Pop</form:option>
            <form:option value="Reggaeton">Reggaeton</form:option>
          </form:select>
          <form:errors path="genre" cssClass="error" />
        </div>

        <div class="mb-3">
          <form:label path="lyrics">Agregar letra:</form:label>
          <form:input type="text" path="lyrics" class="form-control" />
          <form:errors path="lyrics" cssClass="error" />
        </div>

        <form:errors cssClass="global-error" />

        <input type="submit" value="Agregar!" class="btn btn-primary" />
      </form:form>
      <a href="/${AppConfig.ROUTE_HOME}" class="btn btn-secondary">Cancelar</a>
    </div>

    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
      crossorigin="anonymous"
    ></script>
  </body>
</html>
