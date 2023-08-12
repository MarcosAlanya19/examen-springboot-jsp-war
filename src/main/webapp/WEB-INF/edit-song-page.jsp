<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> <%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %> <%@ page language="java"
contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %> <%@ page import="com.examen.forge.config.AppConfig" %>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Edit Candidate</title>
  </head>
  <body>
    <h1>Edit Candidate</h1>

    <form:form method="POST" action="${pageContext.request.contextPath}/${AppConfig.POST_EDIT_SONG}/${song.id}" modelAttribute="${AppConfig.MA_SONG}">
      <input type="hidden" name="_method" value="PUT" />

      <form:errors cssClass="global-error" />
      <div>
        <form:label path="title">Title:</form:label>
        <form:input type="text" path="title" />
      </div>

      <div>
        <form:label path="genre">Genre:</form:label>
        <form:select path="genre">
          <form:option value="Rock">Rock</form:option>
          <form:option value="Cumbia">Cumbia</form:option>
          <form:option value="Pop">Pop</form:option>
          <form:option value="Reggaeton">Reggaeton</form:option>
        </form:select>
      </div>

      <div>
        <form:label path="lyrics">Add Lyrics:</form:label>
        <form:input type="text" path="lyrics" />
      </div>

      <button type="submit">Update Candidate</button>
    </form:form>

    <button type="button" onclick="deleteSong()">Delete Candidate</button>

    <form id="deleteForm" method="POST" action="${pageContext.request.contextPath}/${AppConfig.POST_DELETE_SONG}/${song.id}">
      <input type="hidden" name="_method" value="DELETE" />
    </form>

    <a href="${pageContext.request.contextPath}/${AppConfig.ROUTE_DETAIL_SONG}/${song.id}">Cancel</a>
  </body>
  <script>
    function deleteSong() {
      var result = confirm('Are you sure you want to delete this candidate?');
      if (result) {
        document.getElementById('deleteForm').submit();
      }
    }
  </script>
</html>
