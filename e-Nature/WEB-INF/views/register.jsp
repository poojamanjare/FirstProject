<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="f"  uri="http://www.springframework.org/tags/form" %> 
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@include file="header.jsp" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

<head>
<style>
.err
{
color:red;
}
.bdr
{
border:1px solid black;
}
.err_bdr
{
border:1px solid red;
}



</style>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, intial-scale=1">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">

<link rel="stylesheet" type="text/css" href="resources/css-file/external.css">

<title>Registration</title>

</head>

<body>
<div class="container">
    <h1>Registration Form</h1>
	<div class="col-lg-12">
	<div class="row">
			<f:form modelAttribute="user" action="saveregister" method="post">
					<div class="col-lg-12">
						<br>
							<%-- <div class="form-group">
								<label>id</label>
								<br>
								 <f:input path="id" placeholder="Enter First Name Here.." class="form-control"/>
							</div> --%>
							<div class="form-group">
							<f:errors path="name" cssClass="err"/><br>
								<label>Name</label>
								<br>
								<f:input path="name" placeholder="Enter Name Here.." class="form-control"/>
							</div>
							<div class="form-group">
							<f:errors path="password" cssClass="err"/><br>
								<label>Password</label>
								<br>
								<f:input path="password" type="password" placeholder="Enter Password Here.." class="form-control"/>
							</div>
							<div class="form-group">
							<f:errors path="address" cssClass="err"/><br>
								<label>Address</label>
								<br>
								<f:input path="address" placeholder="Enter Address Here.." class="form-control"/>
							</div>
							<div class="form-group">
							<f:errors path="email" cssClass="err"/><br>
								<label>Email</label>
								<br>
								<f:input path="email" placeholder="Enter Email Here.." class="form-control"/>
							</div>
							<div class="form-group">
							<f:errors path="phone" cssClass="err"/><br>
								<label>Phone NO.</label>
								<br>
								<f:input path="phone" placeholder="Enter Mobile no. Here.." class="form-control"/>
							</div>		
							<!-- <input type="submit" value="SUBMIT" style="size: 30px">	 -->	
							<br>
							 <!-- <div class="btn-group btn-group-lg"> -->
    <button role="button" class="btn btn-primary">Submit</button>
    <button role="button" class="btn btn-primary">Cancel</button>
<!--   </div> -->	
											
				</div>
			</f:form> 
				</div>
	</div>
	</div>
	<br>
	<br>
<div>
 <%@include file="footer.jsp" %> 
</div>
</body>
</html>