<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>	
<!DOCTYPE html>
<html>
<head>
<title>Login Page</title>

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
<link href="https://fonts.googleapis.com/css?family=Karla|Rubik&display=swap" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="css/myStyles.css">
</head>
<body class="homeBody">
	<div class="d-flex justify-content-center">
		<div class="row justify-content-center">
			<div class="col-12 ">
				<h1>UrbanGarden App</h1>
			</div>
		</div>
	</div>
	<div class="d-flex justify-content-center">

		<div class="row justify-content-center">
			<div class="col-12  ">
				<h5>
					Enter your information below to sign in or <a href="#moreinfo">click
						here</a> to find out more
				</h5>
			</div>
		</div>
	</div>
	<div class="d-flex justify-content-center fullsize">
		<div class="row justify-content-center pb-12">
			<div class="col-sm-12 mx-auto">
				<div class="card">
					<div class="card-header">
						<h3>Sign In</h3>
						<div class="d-flex justify-content-start"></div>
					</div>
					<div class="card-body">
						<form:form action="login.do" method="POST">
							<div class="input-group form-group">
								<div class="input-group-prepend">
									<span class="input-group-text"><i class="fas fa-user"
										style="color: white"></i></span>
								</div>
								<input type="text" class="form-control" placeholder="username" name="username">

							</div>
							<div class="input-group form-group">
								<div class="input-group-prepend">
									<span class="input-group-text"><i class="fas fa-key"
										style="color: white"></i></span>
								</div>
								<input type="password" class="form-control"placeholder="password" name="password">
							</div>
							<div class="row align-items-center remember">
								<input type="checkbox">Remember Me
							</div>
							<div class="form-group">
								<input type="submit" value="Login"
									class="btn float-right">
							</div>
						</form:form>
					</div>
					<div class="card-footer">
						<div class="d-flex justify-content-center links">
							Don't have an account?<a href="addUser.do">Sign Up</a>
						</div>
						<div class="d-flex justify-content-center">
							<a href="#">Forgot your password?</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="container-fluid moreinfo" id="moreinfo">
		<div class="container ">
			<!-- Three columns of text below the image -->
			<div class="row py-6 d-flex justify-content-around">
				<div class="col-lg-4 text-center">
					<img class="rounded-circle"
						src="data:image/gif;base64,R0lGODlhAQABAIAAAHd3dwAAACH5BAAAAAAALAAAAAABAAEAAAICRAEAOw=="
						alt="Generic placeholder image" width="140" height="140">
					<h2>Trade</h2>
					<p>Donec sed odio dui. Etiam porta sem malesuada magna mollis
						euismod. Nullam id dolor id nibh ultricies vehicula ut id elit.
						Morbi leo risus, porta ac consectetur ac, vestibulum at eros.
						Praesent commodo cursus magna.</p>
			<!-- 		<p>
						<a class="btn btn-secondary" href="#" role="button">View
							details</a>
					</p> -->
				</div>
				<!-- /.col-lg-4 -->
				<div class="col-lg-4 text-center">
					<img class="rounded-circle"
						src="data:image/gif;base64,R0lGODlhAQABAIAAAHd3dwAAACH5BAAAAAAALAAAAAABAAEAAAICRAEAOw=="
						alt="Generic placeholder image" width="140" height="140">
					<h2>Share</h2>
					<p>Duis mollis, est non commodo luctus, nisi erat porttitor
						ligula, eget lacinia odio sem nec elit. Cras mattis consectetur
						purus sit amet fermentum. Fusce dapibus, tellus ac cursus commodo,
						tortor mauris condimentum nibh.</p>
					<p>
						<a class="btn " href="addUser.do" role="button">Join Today</a>
					</p>
				</div>
				<!-- /.col-lg-4 -->
				<div class="col-lg-4 text-center">
					<img class="rounded-circle"
						src="data:image/gif;base64,R0lGODlhAQABAIAAAHd3dwAAACH5BAAAAAAALAAAAAABAAEAAAICRAEAOw=="
						alt="Generic placeholder image" width="140" height="140">
					<h2>Shop</h2>
					<p>Donec sed odio dui. Cras justo odio, dapibus ac facilisis
						in, egestas eget quam. Vestibulum id ligula porta felis euismod
						semper. Fusce dapibus, tellus ac cursus commodo, tortor mauris
						condimentum nibh, ut fermentum massa justo sit amet risus.</p>
				<!-- 	<p>
						<a class="btn btn-secondary" href="#" role="button">View
							details</a>
					</p> -->
				</div>
				<!-- /.col-lg-4 -->
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