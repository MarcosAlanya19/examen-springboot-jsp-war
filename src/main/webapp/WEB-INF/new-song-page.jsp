<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %> <%@ taglib prefix="form"
uri="http://www.springframework.org/tags/form" %> <%@ page import="com.examen.forge.config.AppConfig" %>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Examen - Nueva cancion</title>
  </head>
  <body>
    <h1>Add New Song!</h1>
    <form:form method="POST" action="${pageContext.request.contextPath}/${AppConfig.POST_CREATE_SONG}" modelAttribute="${AppConfig.MA_SONG}">
      <form:errors cssClass="global-error" />
      <div>
        <form:label path="title">Title:</form:label>
        <form:input type="text" path="title" />
        <form:errors path="title" cssClass="error" />
        <c:if test="${not empty errorMessage}">
          <p style="color: red">${errorMessage}</p>
        </c:if>
      </div>

      <div>
        <form:label path="genre">Genre:</form:label>
        <form:select path="genre">
          <form:option value="Rock">Rock</form:option>
          <form:option value="Cumbia">Cumbia</form:option>
          <form:option value="Pop">Pop</form:option>
          <form:option value="Reggaeton">Reggaeton</form:option>
        </form:select>
        <form:errors path="genre" cssClass="error" />
      </div>

      <div>
        <form:label path="lyrics">Add Lyrics:</form:label>
        <form:input type="text" path="lyrics" />
        <form:errors path="lyrics" cssClass="error" />
      </div>

      <input type="submit" value="Submit!" />
    </form:form>
    <a href="/${AppConfig.ROUTE_HOME}">Cancel</a>
  </body>
</html>
