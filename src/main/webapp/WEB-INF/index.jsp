<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %> <%@ page
import="com.examen.forge.config.AppConfig" %>

<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Examen - Ingreso</title>
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
      <div class="row w-100 justify-content-center align-items-center" style="height: 100vh">
        <div class="col-lg-4 centered-container">
          <h1 class="text-center mb-5">Ingreso</h1>
          <form
            method="POST"
            action="${pageContext.request.contextPath}/${AppConfig.POST_LOGIN_USER}"
            class="needs-validation"
          >
            <div class="mb-3 w-100">
              <label for="email" class="form-label">Email</label>
              <input type="text" id="email" name="email" class="form-control mb-1 py-3 w-100" required />
            </div>
            <div class="mb-3 w-100">
              <label for="password" class="form-label">Contraseña</label>
              <input type="password" id="password" name="password" class="form-control mb-1 py-3" required />
            </div>
            <button type="submit" class="btn btn-primary w-100">Acceso</button>
          </form>
          <p class="mt-3">¿No tienes cuenta? <a href="/${AppConfig.ROUTE_REGISTRATION}" class="mt-3">Registro</a></p>
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
