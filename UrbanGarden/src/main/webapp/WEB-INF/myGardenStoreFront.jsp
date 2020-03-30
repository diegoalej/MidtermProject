<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
	<div class="d-flex justify-content-center">
		<div class="row justify-content-start">
			<div class="col-12 ">
				<h1>Your Garden Profile</h1>
			</div>
		</div>
	</div>
	<div class="d-flex justify-content-center">
		<div class="row justify-content-start">
			<div class="col-12  ">
				<h5>Welcome back!</h5>
			</div>
		</div>
	</div>
	<div class="d-flex justify-content-center">
		<div class="row py-6 justify-content-center">
			<div class="col-12 text-center pb-1">
				<p>
					<strong>Name: </strong>Steve McStevens
				</p>
				<p>
					<strong>Username: </strong>SteveMc
				</p>
				<p>
					<strong>Role: </strong>Gardener
				</p>
			</div>
		</div>
	</div>
	<div class="container moreinfo" id="moreinfo">
		<div class="container ">
			<!-- Three columns of text below the image -->
			<div class="row py-6 d-flex justify-content-around">
				<div class="col-lg-6">
					<div class="row d-flex justify-content-around">
						<div class="col-lg-12 text-left pb-1">
							<h2>Latest Products</h2>
						</div>
						<!-- THIS WILL HAVE A FOREACH THAT WILL DISPLAY ALL PRODUCTS -->
						<div class="col-lg-12 text-center pb-2">
							
							<div class="row d-flex justify-content-start">
								<div class="col-lg-3 text-center pt-2">

									<img class="rounded-circle"
										src="data:image/gif;base64,R0lGODlhAQABAIAAAHd3dwAAACH5BAAAAAAALAAAAAABAAEAAAICRAEAOw=="
										alt="Generic placeholder image" width="120" height="120">
								</div>
								<div class="col-lg-9 text-left pl-4">
									<h2>Tomato</h2>
									<p>Type: Cherry Tomato</p>
									<p>Amount: 10lbs</p>
									<p>Harvest: Jun 3 2020</p>
									<p>Available: Jun 4 2020</p>
									<p>Expires: Jun 30 2020</p>
									<p>Description: Donec sed odio dui. Cras justo odio, dapibus ac facilisis
								in, egestas eget quam. Vestibulum id ligula porta felis euismod
								semper. Fusce dapibus. Donec sed odio dui. Cras justo odio,
								dapibus ac facilisis in, egestas eget quam. Vestibulum id ligula
								porta felis euismod semper. Fusce dapibus.</p>
									<p>
										<a class="btn btn-secondary" href="#" role="button">Edit
											Product</a>
									</p>
								</div>
							</div>
						</div>
						<!-- /.col-lg-2 -->
						<div class="col-lg-12 text-center pb-2">
							
							<div class="row d-flex justify-content-start">
								<div class="col-lg-3 text-center pt-2">

									<img class="rounded-circle"
										src="data:image/gif;base64,R0lGODlhAQABAIAAAHd3dwAAACH5BAAAAAAALAAAAAABAAEAAAICRAEAOw=="
										alt="Generic placeholder image" width="120" height="120">
								</div>
								<div class="col-lg-9 text-left pl-4">
									<h2>Tomato</h2>
									<p>Type: Cherry Tomato</p>
									<p>Amount: 10lbs</p>
									<p>Harvest: Jun 3 2020</p>
									<p>Available: Jun 4 2020</p>
									<p>Expires: Jun 30 2020</p>
									<p>Description: Donec sed odio dui. Cras justo odio, dapibus ac facilisis
								in, egestas eget quam. Vestibulum id ligula porta felis euismod
								semper. Fusce dapibus. Donec sed odio dui. Cras justo odio,
								dapibus ac facilisis in, egestas eget quam. Vestibulum id ligula
								porta felis euismod semper. Fusce dapibus.</p>
									<p>
										<a class="btn btn-secondary" href="#" role="button">Edit
											Product</a>
									</p>
								</div>
							</div>
						</div>
						<!-- /.col-lg-2 -->
						<div class="col-lg-12 text-center">
							
							<div class="row d-flex justify-content-start">
								<div class="col-lg-3 text-center pt-2">

									<img class="rounded-circle"
										src="data:image/gif;base64,R0lGODlhAQABAIAAAHd3dwAAACH5BAAAAAAALAAAAAABAAEAAAICRAEAOw=="
										alt="Generic placeholder image" width="120" height="120">
								</div>
								<div class="col-lg-9 text-left pl-4">
									<h2>Tomato</h2>
									<p>Type: Cherry Tomato</p>
									<p>Amount: 10lbs</p>
									<p>Harvest: Jun 3 2020</p>
									<p>Available: Jun 4 2020</p>
									<p>Expires: Jun 30 2020</p>
									<p>Description: Donec sed odio dui. Cras justo odio, dapibus ac facilisis
								in, egestas eget quam. Vestibulum id ligula porta felis euismod
								semper. Fusce dapibus. Donec sed odio dui. Cras justo odio,
								dapibus ac facilisis in, egestas eget quam. Vestibulum id ligula
								porta felis euismod semper. Fusce dapibus.</p>
									<p>
										<a class="btn btn-secondary" href="#" role="button">Edit
											Product</a>
									</p>
								</div>
							</div>
						</div>
						<br> <br>
						<div class="row d-flex justify-content-around">
							<div class="col-lg-12 text-center">
								<p>
									<a class="btn btn-secondary" href="#" role="button">New
										Search</a>
								</p>
							</div>
						</div>
					</div>
				</div>
				<!-- /.col-lg-2 -->
				<div class="col-lg-6 text-center">
					<div class="row py-6 d-flex justify-content-around">
						<div class="col-lg-12 text-center pb-1">
							<h2>Description</h2>
							<p>Donec sed odio dui. Cras justo odio, dapibus ac facilisis
								in, egestas eget quam. Vestibulum id ligula porta felis euismod
								semper. Fusce dapibus. Donec sed odio dui. Cras justo odio,
								dapibus ac facilisis in, egestas eget quam. Vestibulum id ligula
								porta felis euismod semper. Fusce dapibus.</p>
							<p>
								This is the address<br>This is the city and zip
							</p>
						</div>
					</div>

				</div>
				<!-- /.col-lg-6 -->
			</div>
		</div>
		<!-- /.row -->
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