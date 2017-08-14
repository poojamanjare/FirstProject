<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page isELIgnored="false"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

<head>
<!-- <style>
.navbar-custom {
    color: #FFFFFF;
    background-color: #CC3333;
}
</style>
 -->
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">

<!-- <link rel="stylesheet" type="text/css" href="resources/css-file/nav.css"> -->
<title>Welcome</title>

</head>

<body>
<nav class="navbar navbar-inverse" role="navigation">
  <div class="container-fluid">
    
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
    <!--    <a class="navbar-brand" href="#">e-NATURE</a>-->
      <img src="resources/images/logo1.jpg" style="width:25%;height:3%">
    </div>

    <!-- ==============Collect the nav links ==========================-->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav">
        <li class="active"></li>
        <li ><a href="index">Home</a></li>
        
        <!--dropdown option for product customer list -->
        <li class="dropdown">
        	<a class="dropdown-toggle" data-toggle="dropdown" href="#">Product Categories<span class="caret"></span></a>
     		<ul class="dropdown-menu">
      			<c:forEach items="${catlist}" var="catValue" >
      				<li><a href="${pageContext.request.contextPath}/productCustList?cid=${catValue.cid}"><c:out value="${catValue.name}"></c:out></a></li>
     			<%-- <li><c:out value="${catValue.cid}"></c:out></li> --%>
     			</c:forEach>
      		</ul>
      	</li>
      	
              
          
     
        <li><a href="contactus">Contact Us</a></li>
         <li><a href="#">About Us</a></li>
         <li><a href="${pageContext.request.contextPath}/adding">Admin</a></li>
         <li><a href="${pageContext.request.contextPath}/productList">Admin List</a></li>
         <li><a href="${pageContext.request.contextPath}/categoryList">Category List</a></li>
         <li><a href="${pageContext.request.contextPath}/supplierList">Supplier List</a></li>
        </ul>
      <!-- =================Right-align navigation bar================ -->
     <ul class="nav navbar-nav navbar-right">
      <li><a href="${pageContext.request.contextPath}/register"><span class="glyphicon glyphicon-user"></span> Register</a></li>
      <li><a href="${pageContext.request.contextPath}/goToLogin"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
    </ul>
      <!-- ==================End================================================ -->
      
      
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>
</body>
</html>