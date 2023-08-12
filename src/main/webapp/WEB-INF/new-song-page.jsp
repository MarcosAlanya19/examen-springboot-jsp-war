<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page import="com.examen.forge.config.AppConfig" %>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Add New Song</title>
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"
      crossorigin="anonymous"
    />
  </head>
  <body>
    <div class="container mt-5">
      <h1>Add New Song!</h1>
      <form:form method="POST" action="${pageContext.request.contextPath}/${AppConfig.POST_CREATE_SONG}" modelAttribute="${AppConfig.MA_SONG}" class="needs-validation">
        <form:errors cssClass="global-error" />
        <div class="mb-3">
          <form:label path="title">Title:</form:label>
          <form:input type="text" path="title" class="form-control" />
          <form:errors path="title" cssClass="error" />
          <c:if test="${not empty errorMessage}">
            <p style="color: red">${errorMessage}</p>
          </c:if>
        </div>

        <div class="mb-3">
          <form:label path="genre">Genre:</form:label>
          <form:select path="genre" class="form-select">
            <form:option value="Rock">Rock</form:option>
            <form:option value="Cumbia">Cumbia</form:option>
            <form:option value="Pop">Pop</form:option>
            <form:option value="Reggaeton">Reggaeton</form:option>
          </form:select>
          <form:errors path="genre" cssClass="error" />
        </div>

        <div class="mb-3">
          <form:label path="lyrics">Add Lyrics:</form:label>
          <form:input type="text" path="lyrics" class="form-control" />
          <form:errors path="lyrics" cssClass="error" />
        </div>

        <button type="submit" class="btn btn-primary">Submit!</button>
      </form:form>
      <a href="/${AppConfig.ROUTE_HOME}" class="btn btn-secondary">Cancel</a>
    </div>

    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
      crossorigin="anonymous"
    ></script>
  </body>
</html>
