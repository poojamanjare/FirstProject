<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form"  uri="http://www.springframework.org/tags/form" %> 
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@include file="header.jsp" %>
<%-- <%@include file="footer.jsp" %>--%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

<head>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, intial-scale=1">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">

<link rel="stylesheet" type="text/css" href="resources/css-file/login.css">
<title>Login</title>

</head>
<body>
<div class="login-page">
<h2 style="text-align: center;"><b>Please Login</b></h2>
<div class="form">
      <form class="login-form">
      <input type="text" placeholder="username" required="required"/>
      <input type="password" placeholder="password" required="required"/>
      <button><a href="/">login</a></button>
      <%-- <a class="btn btn-info" role="button" href="<c:url value="/productCustList?cid"></c:url>">LOGIN</a> --%>
      <p class="message" style="color: black;">Not registered? <a href="register">Create an account</a></p>
    </form>
  </div>
</div>
<br><br>
<br><br>
<br>
<br>
<div>
 <%@include file="footer.jsp" %> 
</div>
</body>
</html>