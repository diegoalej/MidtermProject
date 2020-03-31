<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Your Profile</title>
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
<link
	href="https://fonts.googleapis.com/css?family=Karla|Rubik&display=swap"
	rel="stylesheet">
<link rel="stylesheet" type="text/css" href="css/myStyles.css">
</head>
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
				<li class="nav-item"><a class="nav-link" href="search.do">Search</a></li>
			</ul>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
		</div>
	</nav>
	<!-- MAIN BODY -->
	<div class="container">
		<div class="d-flex justify-content-start">
			<div class="row justify-content-start">
				<div class="col-12 ">
					<h1>Your Garden Profile</h1>
				</div>
				<div class="col-12 ">
					<h5>Welcome back!</h5>
				</div>
			</div>
		</div>
		<div class="d-flex justify-content-start">
			<div class="row justify-content-start">
					<div class="col-4 ">
						<div class="col-lg-12 text-left justify-content-start pt-2">
							
							<div class="col-lg-12 text-left justify-content-start pt-2">

								<img class="rounded-circle"
									src="data:image/gif;base64,R0lGODlhAQABAIAAAHd3dwAAACH5BAAAAAAALAAAAAABAAEAAAICRAEAOw=="
									alt="Generic placeholder image" width="120" height="120">
							</div>
							<div class="col-12 text-left py-3">
								<p>
									<strong>Garden Name: </strong><c:out value="${sessionScope.user.gardenStoreFront.nameOfGarden }"/>
								</p>
								<p>
									<strong>Owner: </strong><c:out value="${sessionScope.user.firstName }"/> <c:out value="${sessionScope.user.lastName }"/>
								</p>
								<p>
									<strong>Role: </strong><c:out value="${sessionScope.user.role }" />
								</p>
								<p>
									<strong>Organic: </strong><c:choose><c:when test="${sessionScope.user.gardenStoreFront.organic}">Yes</c:when><c:otherwise>No</c:otherwise></c:choose>
								</p>
							</div>

						</div>
					</div>
						<div class="col-lg-8 text-left">

							<h2>Description</h2>
							<p><c:out value = "${sessionScope.user.gardenStoreFront.description }"/></p>
							<p>
								<c:out value = "${sessionScope.user.gardenStoreFront.address.street }"/><br><c:out value = "${sessionScope.user.gardenStoreFront.address.city }"/> <c:out value = "${sessionScope.user.gardenStoreFront.address.zipCode }"/>
							</p>
						</div>
					</div>
				</div>
		</div>
	<div class="container moreinfo" id="moreinfo">
		<div class="container ">
			<!-- Three columns of text below the image -->
			<div class="row py-6 d-flex justify-content-around">
				<div class="col-lg-12">
					<div class="row d-flex justify-content-around">
						<div class="col-lg-12 text-left pb-1">
							<h2>Products Available</h2>
						</div>
						<!-- THIS WILL HAVE A FOREACH THAT WILL DISPLAY ALL PRODUCTS -->
						<c:forEach items="${sessionScope.user.gardenStoreFront.gardenProduces}" var="produce">						
						<div class="col-lg-12 text-center pb-2">

							<div class="row d-flex justify-content-start">
								<div class="col-lg-3 text-center pt-2">

									<img class="rounded-circle"
										src="data:image/gif;base64,R0lGODlhAQABAIAAAHd3dwAAACH5BAAAAAAALAAAAAABAAEAAAICRAEAOw=="
										alt="Generic placeholder image" width="120" height="120">
								</div>
								<div class="col-lg-9 text-left pl-4">
									<div class="row d-flex justify-content-center">

										<div class="col-lg-12 justify-content-center pl-4">
											<h2><c:out value = "${produce.product.name}"/></h2>
											<p>Type: <c:out value = "${ produce.product.type}" /></p>
											<p>Amount: <c:out value = "${ produce.amount}" /></p>
											<p>Harvest: <c:out value = "${ produce.harvested}" /></p>
											<p>Available: <c:out value = "${ produce.dateAvailable}" /></p>
											<p>Expires: <c:out value = "${ produce.expires}" /></p>
											<p>Size: <c:out value = "${ produce.product.sizeOfProduct}" /></p>
											<p>Description: <c:out value = "${ produce.product.description}" /></p>
										</div>
									</div>
									<div class="row d-flex justify-content-start">

										<div class="col-lg-4 justify-content-start pl-4">
											<p>
												<a class="btn btn-secondary" href="#" role="button">Edit
													Product</a>
											</p>
										</div>
										<div class="col-lg-4 justify-content-start pl-4">
											<p>
												<a class="btn btn-secondary" href="#" role="button">View
													Offers</a>
											</p>
										</div>
									</div>
								</div>
							</div>
						</div>
						</c:forEach>
						
						
					</div>
					<!-- /.col-lg-2 -->
				</div>
			</div>
			<!-- /.row -->
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