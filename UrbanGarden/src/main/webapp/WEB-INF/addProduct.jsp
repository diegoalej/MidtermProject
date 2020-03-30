<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>New Product</title>
<!--Bootsrap 4 CDN-->
<!-- 	<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
 -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">

<!--Fontawesome CDN-->
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.3.1/css/all.css"
	integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU"
	crossorigin="anonymous">

<!--Custom styles-->
<link rel="stylesheet" type="text/css" href="css/myStyles.css">
</head>
<body>
	<!-- N A V I G A T I O N -->
	<nav class="navbar navbar-expand-lg">
		<a class="navbar-brand" href="home.do">UrbanGarden</a>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav ml-auto">
				<li class="nav-item active"><a class="nav-link" href="home.do">Home
						<span class="sr-only">(current)</span>
				</a></li>
				<li class="nav-item"><a class="nav-link" href="#">Garden</a></li>
				<li class="nav-item"><a class="nav-link" href="#">Offers/Trades</a></li>
				<li class="nav-item"><a class="nav-link" href="#">Profile</a></li>
				<li class="nav-item"><a class="nav-link" href="#">Search</a></li>
			</ul>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
		</div>
	</nav>
	<!-- M A I N  B O D Y -->
	<div class="d-flex justify-content-center">
		<div class="row justify-content-center">
			<div class="col-12 ">
				<h1>Add New Product</h1>
			</div>
		</div>
	</div>
	<div class="d-flex justify-content-center">

		<div class="row justify-content-center">
			<div class="col-12  ">
				<h5>Tell us about your Product</h5>
			</div>
		</div>
	</div>
	<div class="d-flex justify-content-center">
		<div class="container">
			<div class="row py-2">
				<div class="col-sm-12">
					<form:form class="form-horizontal" action="addProduct.do"
						modelAttribute="product">
						<div class="form-group">
							<label> Name of the Product </label> <input class="form-control"
								type="text" name="name" value="${product.name}" />
							<br> 
							<label> Size of Product </label> 
							<br> 
							<div class="form-check form-check-inline">
								<input class="form-check-input" type="checkbox" id="sizeOfProduct" value="${product.sizeOfProduct}"> 
								<label class="form-check-label" for="role">Small</label>
							</div>
							<div class="form-check form-check-inline">
								<input class="form-check-input" type="checkbox" id="sizeOfProduct" value="${product.sizeOfProduct}"> 
								<label class="form-check-label" for="role">Medium</label>
							</div>
							<div class="form-check form-check-inline">
								<input class="form-check-input" type="checkbox" id="sizeOfProduct" value="${product.sizeOfProduct}"> 
								<label class="form-check-label" for="role">Large</label>
							</div>
							<div class="form-check form-check-inline">
								<input class="form-check-input" type="checkbox" id="sizeOfProduct" value="${product.sizeOfProduct}"> 
								<label class="form-check-label" for="role">Extra Large</label>
							</div>
							<br>
							<br>
							<label> Describe your Product </label> <input
								class="form-control" type="text" name="description"
								value="${product.description}" /> 
							<br> 
							<label>Type</label>
							<input class="form-control" type="text" name="type" value="${product.type}"/> 
							<br> 
							<label class="form-check-label" for="role">Add a Product image (Recommended size 200x200)</label>
							<div class="input-group">
								<!-- 	<div class="input-group-prepend">
									<span class="input-group-text" id="imageURL">Upload</span>
								</div> -->
								<div class="custom-file">
									<input type="file" class="custom-file-input" id="imageURL"
										aria-describedby="imageURL"> <label
										class="custom-file-label" for="imageURL">Choose file</label>
								</div>
							</div>
							<br> 
							<input class="form-control" type="hidden" name="active"
								value="true" /> <input type="submit" value="Add Product"
								class="btn btn-primary" />
						</div>
					</form:form>
				</div>
			</div>
		</div>
	</div>
	<!-- Footer -->
	<footer class="footer font-small">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<!-- Copyright -->
					<div class="footer-copyright text-center py-3">© 2020
						Copyright: UrbanGarden App</div>
					<!-- Copyright -->
				</div>
			</div>
		</div>
	</footer>
	<!-- Footer -->
	<script
		src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
	<script
		src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</body>
</html>