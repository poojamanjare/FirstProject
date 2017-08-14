<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@include file="header.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
<title>Insert title here</title>
</head>
<body>

<div>
<c:url value="/supplierUpdate" var="spu"></c:url>
<form action="supplierUpdate" method="post">
<input type="hidden" name="sid" value="${sup.sid }" >

<label>Supplier ID</label>
<input type="number" name="sid" value="${sup.sid }" required/>
<br><br>
<label>Supplier Name</label>
<input type="text" name="supplierName" value="${sup.supplierName }" required/>
<br><br>

<button role="button" class="btn btn-primary">Submit</button>
<button role="button" class="btn btn-primary">Cancel</button>
</form>
</div>


</body>
</html>