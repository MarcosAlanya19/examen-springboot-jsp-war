<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> <%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %> <%@ page language="java"
contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %> <%@ page import="com.examen.forge.config.AppConfig" %>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Edit Candidate</title>
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"
      crossorigin="anonymous"
    />
  </head>
  <body>
    <div class="container mt-5">
      <h1>Edit Candidate</h1>

      <form:form method="POST" action="${pageContext.request.contextPath}/${AppConfig.POST_EDIT_SONG}/${song.id}" modelAttribute="${AppConfig.MA_SONG}">
        <input type="hidden" name="_method" value="PUT" />

        <form:errors cssClass="global-error" />
        <c:if test="${userIdInSession != null && userIdInSession == user.id}">
          <div class="mb-3">
            <form:label path="title">Title:</form:label>
            <form:input type="text" path="title" class="form-control" />
          </div>

          <div class="mb-3">
            <form:label path="genre">Genre:</form:label>
            <form:select path="genre" class="form-select">
              <form:option value="Rock">Rock</form:option>
              <form:option value="Cumbia">Cumbia</form:option>
              <form:option value="Pop">Pop</form:option>
              <form:option value="Reggaeton">Reggaeton</form:option>
            </form:select>
          </div>
        </c:if>

        <c:if test="${userIdInSession != user.id}">
          <div class="mb-3">
            <form:label path="title">Title:</form:label>
            <form:input type="text" path="title" readonly="true" class="form-control" />
          </div>

          <div class="mb-3">
            <form:label path="genre">Genre:</form:label>
            <form:select path="genre" readonly="true" class="form-select">
              <form:option value="${song.genre}" selected="true">${song.genre}</form:option>
            </form:select>
          </div>
        </c:if>

        <div class="mb-3">
          <form:label path="lyrics">Add Lyrics:</form:label>
          <form:input type="text" path="lyrics" class="form-control" />
        </div>

        <button type="submit" class="btn btn-primary">Update Candidate</button>
      </form:form>

      <c:if test="${userIdInSession != null && userIdInSession == user.id}">
        <button type="button" onclick="deleteSong()" class="btn btn-danger mt-3">Delete Candidate</button>
      </c:if>

      <form id="deleteForm" method="POST" action="${pageContext.request.contextPath}/${AppConfig.POST_DELETE_SONG}/${song.id}">
        <input type="hidden" name="_method" value="DELETE" />
      </form>

      <a href="${pageContext.request.contextPath}/${AppConfig.ROUTE_DETAIL_SONG}/${song.id}" class="btn btn-secondary mt-3">Cancel</a>
    </div>

    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
      crossorigin="anonymous"
    ></script>
    <script>
      function deleteSong() {
        var result = confirm('Are you sure you want to delete this candidate?');
        if (result) {
          document.getElementById('deleteForm').submit();
        }
      }
    </script>
  </body>
</html>
