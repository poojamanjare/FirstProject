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
<link rel="stylesheet" type="text/css" href="resources/css-file/external.css">
<title>adding</title>
</head>
<body>
<div class="container1">
	<div class="page-header">
	<br>
		<h4>Admin Adding Page.........!!!!!!!!!!!!</h4>
	<br>
	</div>

<!-- ==========================Heading====================================================================== -->
	<div class="container">
		<div class="col-md-12">
			<div class="panel with-nav-tabs panel-primary">
				<div class="panel-heading">
					<ul class="nav nav-tabs">
						<li class="active"><a href="#tab1primary" data-toggle="tab">Category</a></li>
						<li><a href="#tab2primary" data-toggle="tab">Supplier</a></li>
						<li><a href="#tab3primary" data-toggle="tab">Product</a></li>
					</ul>
				</div>
			</div> 
<!-- ==============================END======================================================================== -->
			<div class="panel-body">
				<div class="tab-content">
					<div class="tab-pane fade in active" id=tab1primary>
						<form action="<c:url value="/saveCat"/>" method="post" class="form-signin" >
							<h4 class="input-title">Category ID</h4>
								<input class="form-control" type="number" name="cid" required/><br>

							<h4 class="input-title">Category Name</h4>
								<input class="form-control" type="text" name="name" required/><br>

							<button role="button" class="btn btn-primary">Submit</button>
   							 <button role="button" class="btn btn-primary">Cancel</button>
							<!-- <button type="button" class="btn btn-lg btn-info">Submit</button>
							<button type="reset" class="btn btn-lg btn-info">Reset</button>	 -->
						</form>
					</div>
					
<!-- ========================For Supplier============================================================================ -->
					<div class="tab-pane fade" id=tab2primary>
						<form action="<c:url value="/saveSupp"/>" method="post" class="form-signin">
							<span id="reauth-email" class="reauth-email"></span>
								<h4 class="input-title">Supplier ID</h4>
									<input class="form-control" type="number" name="sid" required/><br>

								<h4 class="input-title">Supplier Name</h4>
									<input class="form-control" type="text" name="supplierName" required/><br>

								<button role="button" class="btn btn-primary">Submit</button>
   							 	<button role="button" class="btn btn-primary">Cancel</button>
								
								<!-- <button type="button" class="btn btn-lg btn-info">Submit</button>
								<button type="reset" class="btn btn-lg btn-info">Reset</button>	 -->
						</form>
					</div>
<!-- ==============================End================================================================================ -->			
					<div class="tab-pane fade" id=tab3primary>
						<form action="<c:url value="/saveProduct"/>" method="post" class="form-signin" enctype="multipart/form-data"/>
							<span id="reauth-email" class="reauth-email"></span>
								<tr>
									<td class="input-title">Product Name</td>
									<td><input type="text" name="pName" required/></td>
								</tr><br><br>

								<tr>
									<td class="input-title">Product Price</td>
									<td><input type="text" name="pPrice" required/></td>
								</tr><br><br>

								<tr>
									<td class="input-title">Product Description</td>
									<td><input type="text" name="pDescription" required/></td>
								</tr><br><br>

								<tr>
									<td class="input-title">Product Stock</td>
									<td><input type="text" name="pStock" required/></td>
								</tr><br><br>
<!--========================================= for category ===========================================================-->
						<div class="from-group">								
							<td>Select Category</td>
							<td>
								<select class="from-control" name="pCategory" required>
									<option value="">----Category------</option>
									<c:forEach items="${catList }" var="cate">
										<option value="${cate.cid }">${cate.name }</option>
									</c:forEach>
								</select>
							</td>
						</div><br>
<!-- ==================== for supplier=============================================================================== -->
						<div class="from-group">								
							<td>Select Supplier</td>
							<td>
								<select class="from-control" name="pSupplier" required>
									<option value="">------Supplier------</option>
									<c:forEach items="${satList }" var="sate">
										<option value="${sate.sid }">${sate.supplierName }</option>
									</c:forEach>
								</select>
							</td>
						</div><br>
<!-- ==================for image================================================================================== -->
						<tr>
							<div class="fileinput fileinput-new" data-provides="fileinput">
								<tr>
									<td>Image</td>
									<td><input class="form-control" type="file" name="file" accept="images/*"></td>
								</tr>
							</div>
						</tr><br><br>
					<button role="button" class="btn btn-primary">Submit</button>
    				<button role="button" class="btn btn-primary">Cancel</button>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>
</div>
</body>
</html>