<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@include file="header.jsp" %>
  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<style>
body
{
background-image: url("resources/images/wall2.jpg");
}
</style>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, intial-scale=1">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">

<!-- <link rel="stylesheet" type="text/css" href="resources/css-file/carousel.css">
<link rel="stylesheet" type="text/css" href="resources/css-file/social-icon.css"> -->

<%-- <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css-file/social-icon.css"/> --%>
<title>E-Nature</title>

</head>
<body>
<!-- <nav class="navbar navbar-inverse" role="navigation">
  <div class="container-fluid">
    
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
       <a class="navbar-brand" href="#">e-NATURE</a>
      <img src="images\logo1.jpg" style="width:30%;height:30%">
    </div>

    ==============Collect the nav links ==========================
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav">
        <li class="active"></li>
        <li ><a href="#">Home</a></li>
        
        dropdown option for products
        <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">Product Category<span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="#">Orchids Plants</a></li>
          <li><a href="#">Rose Plants</a></li>
          <li><a href="#">Marigold Palnts</a></li>
        </ul>
      </li>
        <li><a href="#">Contact Us</a></li>
         <li><a href="#">About Us</a></li>
        </ul>
      =================Right-align navigation bar================
     <ul class="nav navbar-nav navbar-right">
      <li><a href="#"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
      <li><a href="#"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
    </ul>
      ==================End================================================
      
      
    </div>/.navbar-collapse
  </div>/.container-fluid
</nav>
 -->
<!-- 
<div class= "col-lg-12" style="background-color:pink;">NIIT</div>
<div class= "col-lg-12" style="background-color:pink;">LTD</div>
<div class= "col-lg-12" style="background-color:pink;">INDIA</div> -->


<!-- ==========================Carousel slider=================================== -->
<div class="container">
<div id="myCarousel" class="carousel slide" data-ride="carousel">
<ol class="carousel-indicators">
<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
<li data-target="#myCarousel" data-slide-to="1" class="active"></li>
<li data-target="#myCarousel" data-slide-to="2" class="active"></li>
</ol>

<div class="carousel-inner">
<div class="carousel-inner" role="listbox" style=" width:100%; height: 500px !important;">
<div class="item active">
<img src="resources/images/p8.jpg" style="width:100%; height:50%">

</div>
<div class="item">
<img src="resources/images/flower.jpg" style="width:100%;height:50%">

</div>
<div class="item">
<img src="resources/images/p9.jpeg" style="width:100%;height:20%">
</div>
</div>
</div>
<a class="left carousel-control" href="#myCarousel" data-slide="prev">
<span class="glyphicon glyphicon-chevron-left"></span>
<span class="sr-only">Previous</span>
</a>
<a class="right carousel-control" href="#myCarousel" data-slide="next">
<span class="glyphicon glyphicon-chevron-right"></span>
<span class="sr-only">Next</span>
</a>
</div>
</div>
<!-- ================================================================= -->
<!-- <div class ="container">
<div class = "jumbotron">
<p style="font-size:50px; color:#538b01; font-weight:bold; font-style:italic;">
Welcome to<span style="color: #ff0000"> e-NATURE</span></p>
</div>
</div> -->
<!-- ================================================================= -->
<!-- <div class="conatiner">
<p><a href="#"><span class="glyphicon glyphicon-envolope"></span></a><p>
</div> -->
<!--
<div class="container">
<table class="table table-striped">
<tr>
<th> Sr.No.</th> <th> Product Name</th>
</tr>
<tr>
<th> 1</th> <th> rose</th>
</tr>
<tr>
<th> 2</th> <th> marigold</th>
</tr>

</table>

</div>-->
<br><br>
<!-- =====================Images below Slider================================================ -->
<div class="container">
<div style="overflow:auto; background-color: white">
<div class= "col-lg-4">
<img src="resources/images/p1.jpg" width="350" height="250"/></div>
<div class= "col-lg-4">
<img src="resources/images/p2.jpg" width="350" height="250"/></div>
<div class= "col-lg-4">
<img src="resources/images/p3.jpg" width="350" height="250"/></div>
</div> 
</div>
<!-- ====================================================================================== -->
<br>
<br>
<br>
<div>
 <%@include file="footer.jsp" %> 
</div>

<!-- <!-- =========================== Bottom navbar==========================
<nav class="navbar navbar-inverse navbar-fixed-bottom">
  <div class="container-fluid">
    
    <ul class="nav navbar-nav">
      <li class="active"><a href="#">About Us</a></li>
      <a href="#" class="fa fa-facebook"></a>
	  <a href="#" class="fa fa-twitter"></a>
	  <a href="#" class="fa fa-google"></a>
	  <a href="#" class="fa fa-linkedin"></a>
	  <a href="#" class="fa fa-youtube"></a>
      <a href="#" class="fa fa-instagram"></a>
    </ul>
  </div>
</nav>
===========================End===================================== -->



</body>
</html>