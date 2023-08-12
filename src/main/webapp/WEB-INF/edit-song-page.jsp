<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> <%@taglib prefix="form"
uri="http://www.springframework.org/tags/form" %> <%@ page language="java" contentType="text/html;charset=UTF-8"
pageEncoding="UTF-8" %> <%@ page import="com.examen.forge.config.AppConfig" %>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Edit Candidate</title>
  </head>
  <body>
    <h1>Edit Candidate</h1>

    <form:form
      method="POST"
      action="${pageContext.request.contextPath}/candidates/${candidate.id}/update"
      modelAttribute="candidate"
    >
      <input type="hidden" name="_method" value="PUT" />

      <div>
        <form:label path="name">Name:</form:label>
        <form:input path="name" />
      </div>

      <div>
        <form:label path="gender">Gender:</form:label>
        <form:select path="gender">
          <form:option value="Neutral">Neutral</form:option>
          <form:option value="Masculine">Masculine</form:option>
          <form:option value="Female">Female</form:option>
        </form:select>
      </div>

      <div>
        <form:label path="origin">Origin:</form:label>
        <form:select path="origin">
          <form:option value="Perú">Perú</form:option>
          <form:option value="EEUU">EEUU</form:option>
          <form:option value="Colombia">Colombia</form:option>
        </form:select>
      </div>

      <div>
        <form:label path="meaning">Meaning:</form:label>
        <form:textarea path="meaning" />
      </div>

      <button type="submit">Update Candidate</button>
    </form:form>

    <button type="button" onclick="deleteCandidate()">Delete Candidate</button>

    <form id="deleteForm" method="POST" action="${pageContext.request.contextPath}/candidates/${candidate.id}/delete">
      <input type="hidden" name="_method" value="DELETE" />
    </form>

    <a href="${pageContext.request.contextPath}/candidates/${candidate.id}">Cancel</a>
  </body>
  <script>
    function deleteCandidate() {
      var result = confirm('Are you sure you want to delete this candidate?');
      if (result) {
        document.getElementById('deleteForm').submit();
      }
    }
  </script>
</html>
