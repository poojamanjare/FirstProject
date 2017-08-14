<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page isELIgnored="false"%>
    <%@include file="header.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">

<title>Product Customer List</title>
</head>
<body>
<div class="container">
<h2>Product List</h2>
<table class="table table-hover" id="category" class="display" border="1" width="80" align="center">
<tr>
<th>Sr.No.</th>
<th>PID</th>
<th>Name</th>
<th>Supplier</th>
<th>Category</th>
<th>Price</th>
<th style="width:15%">Description</th>
<th>Image</th>
<th>More Details</th>
</tr>
<c:if test="${empty productList }">
	<tr>
		<td colspan="9" align="center">No Records Exists</td>
</c:if>

<c:forEach var="c" varStatus="st" items="${productList }" >
	<tr>
		<td><c:out value="${st.count }"></td></c:out>

		<td><c:out value="${c.id }"></c:out></td>

		<td><c:out value="${c.name }"></c:out></td>

		<td><c:out value="${c.supplier.supplierName }"></c:out></td>

		<td><c:out value="${c.category.name }"></c:out></td>

		<td><c:out value="${c.price }"></c:out></td>

		<td class="span2"><c:out value="${c.description }"></c:out></td>

		<td><img src="${pageContext.request.contextPath}/resources/${c.imgname}" height="50px" width="50px"></td>

		<td class="span4"><c:set var="contextRoot" value="${pageContext.request.contextPath }"></c:set>
		<a class="btn btn-info" role="button" href="<c:url value="/productDetails/${c.id }"></c:url>">Details</a>
		</td>
	</tr>
</c:forEach>
</table>
</div>
</body>
</html>