<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <link href="webjars/bootstrap/5.3.3/css/bootstrap.min.css" rel="stylesheet">
  <title>Login</title>
</head>
<body>
<div class="jumbotron">
  <h1>Spring Boot 3 + JSP</h1>
</div>
<div class="container">
  <div class="row">
    <form:form method="POST" modelAttribute="loginForm">
      <div class="mb-3 row">
        <label for="email" class="col-sm-2 col-form-label">E-Mail</label>
        <div class="col-sm-10">
          <form:input path="email" type="text" cssClass="form-control" id="email"/>
          <form:errors path="email" cssStyle="color: red"/>
        </div>
      </div>
      <div class="mb-3 row">
        <label for="password" class="col-sm-2 col-form-label">Password</label>
        <div class="col-sm-10">
          <form:password path="password" cssClass="form-control" id="password"/>
          <form:errors path="password" cssStyle="color: red"/>
        </div>
      </div>
      <div class="col-auto">
        <form:button type="submit" class="btn btn-primary mb-3">Log In</form:button>
      </div>
    </form:form>
  </div>
  <!--- check login status and display message -->
  <div class="row">
    <% Object status = session.getAttribute("loginStatus");
      if ("OK".equals(status)) { %>
    <div class="alert alert-success" role="alert">
      Congratulations! Login successfully.
    </div>
    <% }
      if ("FAILED".equals(status)) { %>
    <div class="alert alert-danger" role="alert">
      Login failed. Please try again!!!
    </div>
    <% } %>
  </div>
</div>
<script src="webjars/bootstrap/5.3.3/js/bootstrap.min.js"></script>
</body>
</html>